class AddLeaderReferenceToAgendaItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :agenda_items, :users, column: :leader_id
    add_index :agenda_items, :leader_id
    change_column_null :agenda_items, :leader_id, false
  end
end
