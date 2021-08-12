class ChangeDatatypeUnitOfIngredients < ActiveRecord::Migration[6.0]
  def change
    change_column :ingredients, :unit, :string
  end
end
