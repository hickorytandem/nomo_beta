class AddPhoneNumberToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :card_detail, :string
    add_reference :users, :restautant, index: true, null: true
  end
end
