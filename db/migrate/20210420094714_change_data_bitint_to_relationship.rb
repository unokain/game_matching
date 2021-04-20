class ChangeDataBitintToRelationship < ActiveRecord::Migration[5.2]
  def change
    change_column_null :relationships, :follower_id, false
    change_column_null :relationships, :followed_id, false
  end
end
