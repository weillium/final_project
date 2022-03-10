class AddAgendaItemReferenceToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :photos, :agenda_items
    add_index :photos, :agenda_item_id
    change_column_null :photos, :agenda_item_id, false
  end
end
