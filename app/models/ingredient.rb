class Ingredient < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :seller, class_name: "User", foreign_key: :seller_id
  has_one_attached :photo
  enum status: { sold: 0, unsold: 1 }
  enum public_status: { unavailable: 0, available: 1 }
  validates :name, :price_cents, :expiry_date, :unit, :stock_amount, presence: true
  monetize :price_cents

end
