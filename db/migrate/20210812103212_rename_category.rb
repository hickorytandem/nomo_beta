class RenameCategory < ActiveRecord::Migration[6.0]
  def change
    rename_column :restaurants, :catogory, :category
  end
end
