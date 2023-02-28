class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :beast, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :status
      t.float :total_price

      t.timestamps
    end
  end
end
