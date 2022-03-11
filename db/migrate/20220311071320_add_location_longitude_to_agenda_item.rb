class AddLocationLongitudeToAgendaItem < ActiveRecord::Migration[6.0]
  def change
    add_column :agenda_items, :location_longitude, :float
  end
end
