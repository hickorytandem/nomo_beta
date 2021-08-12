class Order < ApplicationRecord

  belongs_to :buyer, class_name: "User"

  has_many :ingredients

  validates :total_price, :pay_method, :status, presence: true
end
