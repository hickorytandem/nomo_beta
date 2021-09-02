require 'nokogiri'
require 'open-uri'
require 'date'

class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:show, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @all_ingredients = policy_scope(Ingredient.where(status: 1, public_status: 1))
    @all_six_ing = @all_ingredients.first(6)

    @restaurants = Restaurant.near(current_user.address, 10)
    @near_ingredients = []
    @restaurants.each do |restaurant|
      @near_ingredients << policy_scope(restaurant.ingredients_for_sale)
    # @ingredients << restaurant.users.first.ingredients_as_seller
    end
    @near_ingredients = @near_ingredients.flatten.first(3)

    @expire_today_ingredients = policy_scope(Ingredient.where(status: 1, public_status: 1).where(expiry_date: Date.today))
    @expire_today_three_ing = @expire_today_ingredients.first(3)
    if params[:query].present?
      @ingredients = Ingredient.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @ingredients = Ingredient.all
    end
  end

  def my_ingredients
    @ingredients = Ingredient.where(seller_id: current_user.id).where("expiry_date >= ?", Date.today).reverse_order
    @expired_ingredients = Ingredient.where(seller_id: current_user.id).where("expiry_date < ?", Date.today).reverse_order
    @sold_ingredients = Ingredient.where(seller_id: current_user, status: :sold)
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
    @paired_ingredients = Ingredient.all.sample(3)
    @restaurant = @ingredient.seller.restaurant
    @marker = {
        lat: @restaurant.latitude,
        lng: @restaurant.longitude
    }
    @order = current_user.pending_order || Order.new

    ingredient = @ingredient.name
    url = "https://www.allrecipes.com/search/results/?search=#{ingredient}"
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)

    @recipe_hashes = []

    html_doc.search('.card__title').first(3).each do |element|
      @name = element.text.strip
      @recipe_hashes << { name: @name }
    end

    html_doc.search('.card__titleLink').first(3).each_with_index do |ele, index|
      @recipe_hashes[index][:link] = ele.attribute('href').value
      html_file_for_recipe = URI.open(@recipe_hashes[index][:link]).read
      html_file_for_recipe_doc = Nokogiri::HTML(html_file_for_recipe)
      @recipe_hashes[index][:time] = html_file_for_recipe_doc.search('.recipe-meta-item-body')[2].text.strip
      @recipe_hashes[index][:num_of_ingredients] = html_file_for_recipe_doc.search('.ingredients-item').count
    end

    html_doc.search('.review-star-text').first(3).each_with_index do |ele, index|
      @recipe_hashes[index][:review] = ele.children.first.text.split(" ")[1]
    end

    html_doc.search('.card__authorName').first(3).each_with_index do |ele, index|
      @recipe_hashes[index][:author] = ele.text.strip
    end
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
    params.require(:ingredient).permit(:name, :photo, :unit_price, :expiry_date, :weight, :stock_amount, :unit, :discount_rate, :public_status, :description, :status, :price_cents)
  end
end
