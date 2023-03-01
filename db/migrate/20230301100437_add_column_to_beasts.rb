class AddColumnToBeasts < ActiveRecord::Migration[7.0]
  def change
    add_column :beasts, :name, :string
    add_column :beasts, :description, :string
  end
end
