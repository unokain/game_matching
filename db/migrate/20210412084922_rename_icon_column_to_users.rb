class RenameIconColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :icon, :image 
  end
end
