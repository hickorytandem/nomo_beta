class AddBuyerToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_reference :ingredients, :buyer, null: false, foreign_key: { to_table: :users }
  end
end
