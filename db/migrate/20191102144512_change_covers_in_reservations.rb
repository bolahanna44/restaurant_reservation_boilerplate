class ChangeCoversInReservations < ActiveRecord::Migration[6.0]
  def change
    change_column :reservations, :covers, :text
  end
end
