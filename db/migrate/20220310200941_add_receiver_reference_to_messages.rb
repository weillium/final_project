class AddReceiverReferenceToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :message_groups, column: :receiver_id
    add_index :messages, :receiver_id
    change_column_null :messages, :receiver_id, false
  end
end
