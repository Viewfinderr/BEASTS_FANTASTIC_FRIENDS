class AddCoordinatesToBeasts < ActiveRecord::Migration[7.0]
  def change
    add_column :beasts, :latitude, :float
    add_column :beasts, :longitude, :float
  end
end
