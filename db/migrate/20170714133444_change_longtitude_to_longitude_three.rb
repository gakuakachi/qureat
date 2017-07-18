class ChangeLongtitudeToLongitudeThree < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :restaurants, :longtitude, :longitude
  end
end
