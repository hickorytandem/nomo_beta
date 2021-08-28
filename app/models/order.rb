class Order < ApplicationRecord

  belongs_to :buyer, class_name: "User"
  # belongs_to :sellers, through: :ingredients, class_name: "User"
  has_many :ingredients
  has_many :sellers, through: :ingredients
  # validates :total_price, :status, presence: true
  # enum status: [:pending, :purchased, :cancelled, :collected ]

end
