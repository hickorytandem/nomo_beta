require 'nokogiri'
require 'open-uri'

class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:show, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @ingredients = policy_scope(Ingredient.all)
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
    @ingredients = Ingredient.where(seller: @ingredient.seller).sample(3)

    ingredient = @ingredient.name
    url = "https://www.bbcgoodfood.com/search/recipes?q=#{ingredient}"
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)

    @recipes = []
    html_doc.search('.standard-card-new__article-title').each do |element|
      @recipes << { name: element.text.strip, link: "https://www.bbcgoodfood.com/recipes" + element.attribute('href').value }
    end
    @recipes_hash = @recipes.sample(3)


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
    if ingredient_params[:order_id].present?
      @order = Order.find(ingredient_params[:order_id])
      @ingredient.update(order: @order)
      redirect_to my_cart_path
    else
      @order = Order.create(buyer: current_user, status: :pending, total_price: 0)
      @ingredient.update(order: @order)
      redirect_to my_cart_path
    end
  end

  def destroy

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
