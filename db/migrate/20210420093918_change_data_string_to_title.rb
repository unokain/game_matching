class ChangeDataStringToTitle < ActiveRecord::Migration[5.2]
  def change
    change_column_null :plans, :title, false
    change_column_null :plans, :content, false
    change_column_null :plans, :start_time, false
    change_column_null :plans, :limit_time, false
  end
end
