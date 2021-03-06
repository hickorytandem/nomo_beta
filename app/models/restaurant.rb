class Restaurant < ApplicationRecord
  validates :name, :closing_hours, :opening_hours, presence: true
  has_many :users
  # has_many :ingredients, class_name: "Ingredient", foreign_key: :seller_id
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def ingredients_for_sale
    user_ids = users.ids
    Ingredient.where(seller_id: user_ids)
  end
end
