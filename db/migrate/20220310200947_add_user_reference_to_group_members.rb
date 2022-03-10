class AddUserReferenceToGroupMembers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :group_members, :users
    add_index :group_members, :user_id
    change_column_null :group_members, :user_id, false
  end
end
