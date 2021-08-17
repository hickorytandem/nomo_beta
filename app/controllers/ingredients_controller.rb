class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @all_ingredients = policy_scope(Ingredient.all)
    @restaurants = Restaurant.near(current_user.address, 10) 
    @ingredients = [] 
    @restaurants.each do |restaurant| 
      @ingredients << policy_scope(restaurant.ingredients)
    # @ingredients << restaurant.users.first.ingredients_as_seller 
    end
    @ingredients = @ingredients.flatten
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    authorize @ingredient
    if @ingredient.save
      redirect_to ingredients_path
    else
      render :new
    end
  end

  def show
    @restaurant = @ingredient.seller.restaurant
    @marker = {
        lat: @restaurant.latitude,
        lng: @restaurant.longitude
    }
    skip_authorization
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def near

  end

  private

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :photo, :unit_price, :expiry_date, :weight, :stock_amount, :unit, :discount_rate, :publish_status, :description, :status)
  end
end
