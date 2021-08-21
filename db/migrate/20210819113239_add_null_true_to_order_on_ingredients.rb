class AddNullTrueToOrderOnIngredients < ActiveRecord::Migration[6.0]
  def change
    change_column :ingredients, :order_id, :bigint, null:true
  end
end
