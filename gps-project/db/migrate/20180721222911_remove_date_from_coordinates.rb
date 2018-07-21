class RemoveDateFromCoordinates < ActiveRecord::Migration[5.2]
  def change
    remove_column :coordinates, :date, :date
  end
end
