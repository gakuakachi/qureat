class ChangeLongtitudeToLongitude < ActiveRecord::Migration[5.0]

  def up
    change_column(:restaurants, :longtitude, :float)
  end

  def down
    change_column(:restaurants, :longitude, :float)
  end
end
