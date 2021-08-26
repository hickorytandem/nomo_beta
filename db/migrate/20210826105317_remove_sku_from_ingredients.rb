class RemoveSkuFromIngredients < ActiveRecord::Migration[6.0]
  def change
    remove_column :ingredients, :sku, :string
  end
end
