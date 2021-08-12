class Order < ApplicationRecord
  belongs_to :buyer, class_name: "User", foreign_key: :buyer_id
  has_many :ingredients

  validates :total_price, :pay_method, :status, presence: true
end
