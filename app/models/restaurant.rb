class Restaurant < ApplicationRecord
  validates :name, :closing_hours, :opening_hours, presence: true
  has_many :users
end
