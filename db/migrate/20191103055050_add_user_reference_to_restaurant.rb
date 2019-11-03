class AddUserReferenceToRestaurant < ActiveRecord::Migration[6.0]
  def change
    add_reference :restaurants, :user
  end
end
