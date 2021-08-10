class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :unit_price
      t.date :expiry_date
      t.integer :weight
      t.integer :stock_amount
      t.integer :unit
      t.integer :discount_rate
      t.integer :public_status
      t.text :description
      t.integer :status

      t.timestamps
    end
  end
end
