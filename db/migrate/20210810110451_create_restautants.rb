class CreateRestautants < ActiveRecord::Migration[6.0]
  def change
    create_table :restautants do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone_number
      t.string :catogory
      t.integer :opening_hours
      t.integer :closing_hours
      t.string :payment_method

      t.timestamps
    end
  end
end
