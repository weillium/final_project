class AddCreatorReferenceToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :notifications, :users, column: :creator_id
    add_index :notifications, :creator_id
    change_column_null :notifications, :creator_id, false
  end
end
