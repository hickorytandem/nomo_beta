class Order < ApplicationRecord
  belongs_to :user
  has_many :ingredients

  validates :total_price, :pay_method, :status, presence: true
end
