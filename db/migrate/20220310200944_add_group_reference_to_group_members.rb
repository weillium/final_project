class AddGroupReferenceToGroupMembers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :group_members, :message_groups, column: :group_id
    add_index :group_members, :group_id
    change_column_null :group_members, :group_id, false
  end
end
