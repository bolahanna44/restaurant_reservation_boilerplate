class RemoveEmailFromRestaurant < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :email
  end
end
