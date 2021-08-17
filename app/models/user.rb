class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :restaurant, optional: true
  has_many :orders, :ingredients
  has_many :ingredients_as_seller, class_name: "Ingredient", foreign_key: :seller_id
  # has_many :ingredients_as_buyer, through: :orders, source: ingredients
  # validates :address, :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  def pending_order
    Order.where(buyer: self).find_by(status: :pending)
  end
end
