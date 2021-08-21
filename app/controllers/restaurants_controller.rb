class RestaurantsController < ApplicationController
  def index
  end

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    authorize @restaurant
    @restaurant.users = current_user
    if @restaurant.save
      redirect_to ingredients_path
    else
      render :new
    end
  end

end
