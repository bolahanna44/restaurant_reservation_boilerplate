class ChangeAssocationInReservations < ActiveRecord::Migration[6.0]
  def change
    remove_column :reservations, :guest_id
    add_reference :reservations, :user
  end
end
