class AddNamesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :icon, :string
    add_column :users, :name, :string
    add_column :users, :game_skill, :text
    add_column :users, :self_profile, :text
  end
end
