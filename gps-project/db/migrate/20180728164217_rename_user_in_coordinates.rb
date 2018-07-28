class RenameUserInCoordinates < ActiveRecord::Migration[5.2]
  def change
    rename_column :coordinates, :user, :user_id
  end
end
