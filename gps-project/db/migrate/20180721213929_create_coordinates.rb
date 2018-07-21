class CreateCoordinates < ActiveRecord::Migration[5.2]
  def change
    create_table :coordinates do |t|
      t.decimal :longitude
      t.decimal :latitude
      t.date :date
      t.integer :user

      t.timestamps
    end
  end
end
