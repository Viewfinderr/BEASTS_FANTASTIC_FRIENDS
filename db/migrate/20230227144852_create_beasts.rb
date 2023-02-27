class CreateBeasts < ActiveRecord::Migration[7.0]
  def change
    create_table :beasts do |t|
      t.string :race
      t.integer :danger_gauge
      t.string :tags
      t.float :price_per_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
