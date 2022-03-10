class AddLocationFormattedAddressToAgendaItem < ActiveRecord::Migration[6.0]
  def change
    add_column :agenda_items, :location_formatted_address, :string
  end
end
