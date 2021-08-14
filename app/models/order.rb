class Order < ApplicationRecord

  belongs_to :buyer, class_name: "User"
  has_many :ingredients
  validates :total_price, :status, presence: true
  enum status: [:pending, :paid, :cancelled ]
end
