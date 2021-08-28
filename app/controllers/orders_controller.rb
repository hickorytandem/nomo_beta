class OrdersController < ApplicationController
  before_action :find_order, only: [:show, :destroy]

  def index
    @orders = policy_scope(Order)
    @collected_orders = @orders.where(status: :collected, buyer: current_user)
    @not_collected_orders = @orders.where(status: :purchased, buyer: current_user)
    @my_orders = []

    Order.where(buyer: current_user).each do |order|
      order.ingredients.each do |ingredient|
        @my_orders << ingredient.stock_amount
      end
    end
    @my_ingredients = @my_orders.sum
  end

  def new
    # @order = Order.new
    @orders = Order.where(status: :pending, buyer: current_user)
    skip_authorization
    @ingredient_price = []
    @orders.each do |order|
      order.ingredients.each do |ingredient|
        @ingredient_price << ingredient.price_cents
      end
      @order_total_price = @ingredient_price.sum
    end
  end

  def create
    ingredient = Ingredient.find(params[:ingredient_id])
    order  = Order.create!(ingredient: ingredient, pay_method: ingredient.pay_method, amount: ingredient.price, status: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: ingredient.name,
        images: [ingredient.photo],
        amount: ingredient.price_cents,
        currency: 'usd',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to checkout_path(order)
  end
  # def create

  #   @order = Order.new(total_price: 0, status: :pending)
  #   authorize @order
  #   @order.buyer = current_user
  #   if @order.save
  #     @ingredient = Ingredient.find(order_params[:ingredient_id])
  #     @ingredient.update(order: @order)
  #     redirect_to order_path(@order)
  #   else
  #     render :new
  #   end

  # end

  def success
    skip_authorization
  end


  def show
    @order = current_user.orders.find(params[:id])
  end

  def edit
    @order = find_order_in_cart
    authorize @order

    @ingredients = Ingredient.where(order_id: @order)
    @total_price = []
    @ingredients.each do |ingredient|
      @total_price << ingredient.price_cents
    end

    @order_total_price = @total_price.sum/100.to_f
  end

  def update
    @order = find_order_in_cart
    @ingredients = Ingredient.where(order_id: @order)
    authorize @order
    if @order.update(order_params)
      @ingredients.each { |ingredient| ingredient.update(status: 0, public_status: 0)}
      redirect_to my_cart_success_path
    else
      render :new
    end
  end

  def destroy

  end

  # --------------------------------------------------------------------------------
  # Seller Controller
  # --------------------------------------------------------------------------------
  def my_orders
    # @orders = policy_scope(Order)
    # authorize @orders
    # @orders = Order.all.map do |order|
    #   policy_scope(order)
    # end
    @shop_name = current_user.restaurant.name
    @orders = policy_scope(Order).select { |order| order.sellers.include?(current_user) }
    # authorize @orders
    # @collected_orders = @orders.where(status: :collected)
    # @not_collected_orders = @orders.where(status: :purchased)
    @my_orders = []

  #   Order.where(buyer: current_user).each do |order|
  #     order.ingredients.each do |ingredient|
  #       @my_orders << ingredient.stock_amount
  #     end
  #   end
  #   @my_ingredients = @my_orders.sum
  # end

  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def find_order_in_cart
    @orders = Order.where(status: :pending, buyer: current_user)
    @orders.first
  end

  def order_params
    # params.permit(:ingredient_id)
    params.require(:order).permit(:total_price, :pay_method, :status, :ingredient_id)
  end

  def find_ingredient
     @ingredients = Ingredient.where(order_id: @order)
  end
end
