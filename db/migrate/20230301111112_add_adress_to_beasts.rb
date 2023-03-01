class AddAdressToBeasts < ActiveRecord::Migration[7.0]
  def change
    add_column :beasts, :adress, :string
  end
end
