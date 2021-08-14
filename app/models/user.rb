class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :restaurant, optional: true
  has_many :orders
  # validates :address, :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def pending_order
    Order.where(buyer: self).find_by(status: :pending)
  end
end
