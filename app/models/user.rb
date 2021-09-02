class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :restaurant, optional: true
  has_many :orders
  # has_many :ingredients
  has_many :ingredients_as_seller, class_name: "Ingredient", foreign_key: :seller_id
  has_many :orders_as_seller, -> { distinct }, through: :ingredients_as_seller, source: :order
  has_many :buyers, through: :orders_as_seller
  # has_many :orders_as_seller, primary_key: :seller_id, foreign_key: order_id
  # has_many :ingredients_as_buyer, through: :orders, source: ingredients
  # validates :address, :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  def pending_order
    Order.where(buyer: self).find_by(status: :pending)
  end

  def owner?
    restaurant.present?
  end

  def order_total_price
    @order = self.pending_order
    @ingredient_price = []
     @order.ingredients.each do |ingredient|
        @ingredient_price << ingredient.price * ingredient.stock_amount
      end
    @order_total_price = @ingredient_price.sum
  end

end
