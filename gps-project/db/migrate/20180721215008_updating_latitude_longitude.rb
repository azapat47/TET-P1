class UpdatingLatitudeLongitude < ActiveRecord::Migration[5.2]
  def change
    change_column :coordinates, :latitude, :decimal, { precision: 10, scale: 6 }
    change_column :coordinates, :longitude, :decimal, { precision: 10, scale: 6 }
  end
end
