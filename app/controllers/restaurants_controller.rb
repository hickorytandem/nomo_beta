class RestaurantsController < ApplicationController
  def index
  end

  def dashboard
    skip_authorization
    @shop_name = current_user.restaurant.name
    @all_ingredients = current_user.restaurant.ingredients_for_sale
    @sold_ingredients = @all_ingredients.where(status: "sold")
    @unsold_ingredients = @all_ingredients.where(status: "unsold")
     ##  Rescued Food
    @total_weight = @sold_ingredients.map(&:weight).sum

    # Revenue
    # @revenue = 0
    # @sold_ingredients.each do |ingredient|
    #   @revenue += ingredient.unit_price * ingredient.stock_amount
    # end

    # CO2 emission saved
    @co2 = @total_weight * 2.54

    # amount added items
    # @total_amount = @all_ingredients.each.map(&:stock_amount).sum

    # sold_amount
    # @sold_amount = 0
    # @sold_ingredients.each do |ingredient|
    #   @sold_amount += ingredient.stock_amount
    # end

    # # wasted amount
    # @unsold_amount = 0
    # @unsold_ingredients.each do |ingredient|
    #   @unsold_amount += ingredient.stock_amount
    # end
    # percentage sold/added
    @sales_probability = (@sold_amount.to_f / @total_amount.to_f) * 100

    # products most sold
    # return max using symbol(stock_amount) of instance
    @most_sold = @sold_ingredients.order(:stock_amount).last
    # return ingredients name

    # ??number of customers
    @total_customers = current_user.buyers
    # @total_customers = @all_ingredients.map{ |ingredient| ingredient&.order}
    # @total_customers = @all_ingredients.map{ |ingredient| ingredient&.order&.buyer_id}.uniq

    # order to be picked up
    @orders = current_user.orders_as_seller
    # @orders = Order.all.select { |order| order.sellers.include?(current_user) }.count

    @orders_to_collect = @orders.where(status:"purchased")

    #Ingredient expires soon
    @expire_soon = current_user.ingredients_as_seller.where(expiry_date: Date.today..Date.tomorrow)
  end

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.users << current_user
    authorize @restaurant
    if @restaurant.save
      redirect_to ingredients_path
    else
      render :new
    end
  end

  def settings
    skip_authorization
    @shop_name = current_user.restaurant.name
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :email, :phone_number, :category, :opening_hours, :closing_hours, :payment_method, :address)
  end

end
