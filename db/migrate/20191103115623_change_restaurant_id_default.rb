class ChangeRestaurantIdDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :reservations, :restaurant_id, :integer, null: true
  end
end
