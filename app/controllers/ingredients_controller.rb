class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:show, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @all_ingredients = policy_scope(Ingredient.where(status: 1, public_status: 1))
    @restaurants = Restaurant.near(current_user.address, 10) 
    @ingredients = [] 
    @restaurants.each do |restaurant| 
      @ingredients << policy_scope(restaurant.ingredients)
    # @ingredients << restaurant.users.first.ingredients_as_seller 
    end
    @ingredients = @ingredients.flatten
  end

  def my_ingredients
    @ingredients = Ingredient.where(seller_id: current_user.id)
    authorize @ingredients
  end

  def new
    @ingredient = Ingredient.new
    authorize @ingredient
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    authorize @ingredient
    @ingredient.seller = current_user
    if @ingredient.save
      redirect_to ingredients_path
    else
      render :new
    end
  end

  def show
    @ingredients = Ingredient.where(seller: @ingredient.seller).sample(3)
    @recipes = Ingredient.all.sample(3)
    @restaurant = @ingredient.seller.restaurant
    @marker = {
        lat: @restaurant.latitude,
        lng: @restaurant.longitude
    }
   @order = current_user.pending_order || Order.new

  end

  def edit

  end

  def update
    if current_user.pending_order.present?
      @order = current_user.pending_order
    else
      @order = Order.create(buyer: current_user, status: :pending, total_price: 0)
    end
    @ingredient.update(order: @order)
    redirect_to ingredient_path(@ingredient, cart:"open")
  end

  def destroy

  end

  def near

  end

  private

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
    authorize @ingredient
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :photo, :unit_price, :expiry_date, :weight, :stock_amount, :unit, :discount_rate, :publish_status, :description, :status)
  end
end
