class AddIdToRestaurant < ActiveRecord::Migration[6.0]
  def change
     add_reference :users, :restaurants, index: true, null: true
  end
end
