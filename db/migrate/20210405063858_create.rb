class Create < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :title
      t.text :content	
      t.datetime :start_time
      t.datetime :limit_time
      
      t.timestamps
    end
  end
end
