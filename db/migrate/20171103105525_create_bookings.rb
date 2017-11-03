class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :lesson_date
      t.time :start_time
      t.time :end_time
      t.references :profile, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
