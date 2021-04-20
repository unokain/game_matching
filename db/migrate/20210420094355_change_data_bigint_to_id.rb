class ChangeDataBigintToId < ActiveRecord::Migration[5.2]
  def change
    change_column_null :plan_users, :plan_id, false
    change_column_null :plan_users, :taker_id, false
  end
end
