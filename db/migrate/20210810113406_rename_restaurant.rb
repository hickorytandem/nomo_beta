class RenameRestaurant < ActiveRecord::Migration[6.0]
  def change
    rename_table :restautants, :restaurants
  end
end
