class Ingredient < ApplicationRecord
  belongs_to :order
  belongs_to :user
  enum status: { sold: 0, unsold: 1 }
  enum public_status: { unavailable: 0, available: 1 }
end
