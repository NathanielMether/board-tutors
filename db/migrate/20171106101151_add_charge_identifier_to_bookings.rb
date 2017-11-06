class AddChargeIdentifierToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :charge_identifier, :string
  end
end
