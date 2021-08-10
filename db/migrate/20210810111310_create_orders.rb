class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :total_price
      t.string :pay_method
      t.string :status
      t.references :buyer_id, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
