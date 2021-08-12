class RemoveBuyerIdFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :buyer_id, :bigint
  end
end
