class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:show]

  def index

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

  private

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :photo, :unit_price, :expiry_date, :weight, :stock_amount, :unit, :discount_rate, :publish_status, :description, :status)
  end
end
