class AddBuyerToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :buyer, foreign_key: { to_table: :users }
  end
end
