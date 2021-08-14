class OrdersController < ApplicationController
  before_action :find_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = policy_scope(Order)
    @collected_orders = @orders.where(status: "collected")
    @not_collected_orders = @orders.where(status: "not collected")
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
    @orders = Order.where(status: :pending)
    skip_authorization
    @ingredient_price = []
    @orders.each do |order|
      order.ingredients.each do |ingredient|
        @ingredient_price << ingredient.stock_amount * ingredient.unit_price
      end
    @order_total_price = @ingredient_price.sum
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

  def show
  end

  def edit

  end

  def update
    # @order = Order.new
    authorize @order
    #Check out changing status to purchased
  end

  def destroy

  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def order_params
    # params.permit(:ingredient_id)
    params.require(:order).permit(:total_price, :pay_method, :status, :ingredient_id)
  end
end
