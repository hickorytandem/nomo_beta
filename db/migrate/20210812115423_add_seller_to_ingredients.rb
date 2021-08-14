class AddSellerToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_reference :ingredients, :seller, null: false, foreign_key: { to_table: :users }
    remove_reference :ingredients, :buyer
  end
end
