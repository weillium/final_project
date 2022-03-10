class AddLocationLatitudeToAgendaItem < ActiveRecord::Migration[6.0]
  def change
    add_column :agenda_items, :location_latitude, :float
  end
end
