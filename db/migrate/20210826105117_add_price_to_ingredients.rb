class AddPriceToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_monetize :ingredients, :price, currency: { present: false }
  end
end
