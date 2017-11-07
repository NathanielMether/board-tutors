class AddStartAtToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :start_at, :datetime
  end
end
