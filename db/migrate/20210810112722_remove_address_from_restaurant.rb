class RemoveAddressFromRestaurant < ActiveRecord::Migration[6.0]
  def change
    remove_column :restautants, :address
  end
end
