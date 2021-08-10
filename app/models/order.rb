class Order < ApplicationRecord
  belongs_to :user
  has_many :ingredients

  validates :total_price, presence: true
  validates :pay_method, presence: true
  validates :status, presence: true
end
