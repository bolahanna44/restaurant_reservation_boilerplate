class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :cuisines
      t.integer :phone
      t.string :email
      t.text :location
      t.string :opening_hours

      t.timestamps
    end
  end
end
