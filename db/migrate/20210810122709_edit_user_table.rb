class EditUserTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :restautant_id
    remove_column :users, :restaurants_id
    add_reference :users, :restaurant, index: true, null: true
  end
end
