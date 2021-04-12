class CreatePlanUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :plan_users do |t|
      t.references :plan, foreign_key: true
      t.references :taker, foreign_key: {to_table: :users} 
      t.timestamps
    end
  end
end
