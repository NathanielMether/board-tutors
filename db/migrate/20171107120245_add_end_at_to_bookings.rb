class AddEndAtToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :end_at, :datetime
  end
end
