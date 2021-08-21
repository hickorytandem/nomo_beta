class RestaurantsController < ApplicationController
  def index
  end

  def dashboard
    skip_authorization
  end
  
  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    # @restaurant.users = current_user
    authorize @restaurant
    if @restaurant.save
      redirect_to ingredients_path
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :email, :phone_number, :category, :opening_hours, :closing_hours, :payment_method, :address)
  end

end
