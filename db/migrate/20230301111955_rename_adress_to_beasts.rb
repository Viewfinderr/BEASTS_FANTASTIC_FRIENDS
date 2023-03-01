class RenameAdressToBeasts < ActiveRecord::Migration[7.0]
  def change
    rename_column :beasts, :adress, :address
  end
end
