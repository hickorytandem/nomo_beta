class RestaurantsController < ApplicationController
  def index
  end

  def dashboard
    skip_authorization
    @shop_name = current_user.restaurant.name
    @all_ingredients = current_user.restaurant.ingredients_for_sale
    @sold_ingredients = @all_ingredients.select{ |ingredient| ingredient.status == "sold"}
    @wasted_ingredients = @all_ingredients - @sold_ingredients

     ##  Rescued Food
    @total_weight = @sold_ingredients.map(&:weight).sum

    # Revenue
    @revenue = 0
    @sold_ingredients.each do |ingredient|
      @revenue += ingredient.unit_price * ingredient.stock_amount
    end

    # CO2 emission saved
    @co2 = @total_weight * 2.54

    # amount added items
    @total_amount =@all_ingredients.each.map(&:stock_amount).sum

    # sold_amount
    @sold_amount = 0
    @sold_ingredients.each do |ingredient|
      @sold_amount += ingredient.stock_amount
    end

    # wasted amount
    @wasted_amount = 0
    @wasted_ingredients.each do |ingredient|
      @wasted_amount += ingredient.stock_amount
    end

    # percentage sold/added
    @sales_probability = @sold_amount / @total_amount.to_f 

    # products most sold
    # return max using symbol(stock_amount) of instance

    @most_sold = @sold_ingredients.sort_by{ |ingredient| ingredient.stock_amount }.last
    # return ingredients name

    # ??number of customers
    @total_customers = @all_ingredients.map{ |ingredient| ingredient&.order&.buyer_id}.uniq.count
    raise
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
