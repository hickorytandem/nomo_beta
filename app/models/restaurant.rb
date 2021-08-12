class Restaurant < ApplicationRecord
  validates :name, :closing_hours, :opening_hours, presence: true
  has_many :users

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
