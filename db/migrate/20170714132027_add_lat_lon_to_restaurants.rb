class AddLatLonToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :latitude, :float
    add_column :restaurants, :longtitude, :float
  end
end
