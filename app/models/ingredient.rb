class Ingredient < ApplicationRecord
  belongs_to :order
  belongs_to :seller, class_name: "User"
  has_one_attached :photo
  enum status: { sold: 0, unsold: 1 }
  enum public_status: { unavailable: 0, available: 1 }
  validates :name, :unit_price, :expiry_date, :unit, :stock_amount, presence: true

end
