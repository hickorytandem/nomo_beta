require 'nokogiri'
require 'open-uri'

class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:show, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @all_ingredients = policy_scope(Ingredient.where(status: 1, public_status: 1))
    @restaurants = Restaurant.near(current_user.address, 10)
    @near_ingredients = []
    @restaurants.each do |restaurant|
      @near_ingredients << policy_scope(restaurant.ingredients_for_sale)
    # @ingredients << restaurant.users.first.ingredients_as_seller
    end
    @near_ingredients = @near_ingredients.flatten
  end

  def my_ingredients
    @ingredients = Ingredient.where(seller_id: current_user.id).reverse_order
    @expired_ingredients = Ingredient.where(seller_id: current_user.id,expiry_date: Date.new..2.days.ago).reverse_order
    @shop_name = current_user.restaurant.name
    authorize @ingredients
  end

  def new
    @ingredient = Ingredient.new
    @shop_name = current_user.restaurant.name
    authorize @ingredient
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    authorize @ingredient
    @ingredient.seller = current_user
    if @ingredient.save
      redirect_to my_ingredients_path
    else
      render :new
    end
  end

  def show
    @seller_ingredients = Ingredient.where(seller: @ingredient.seller).sample(3)
    @restaurant = @ingredient.seller.restaurant
    @marker = {
        lat: @restaurant.latitude,
        lng: @restaurant.longitude
    }
    @order = current_user.pending_order || Order.new
    ingredient = @ingredient.name
    url = "https://www.bbcgoodfood.com/search/recipes?q=#{ingredient}"
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)

    @recipes = []
    html_doc.search('.standard-card-new__article-title').each do |element|
      @recipes << { name: element.text.strip, link: "https://www.bbcgoodfood.com/recipes" + element.attribute('href').value }
    end
    @recipes_hash = @recipes.sample(3)

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
    params.require(:ingredient).permit(:name, :photo, :unit_price, :expiry_date, :weight, :stock_amount, :unit, :discount_rate, :public_status, :description, :status)
  end
end
