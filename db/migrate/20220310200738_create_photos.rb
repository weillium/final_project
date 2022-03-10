class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.integer :upload_user_id
      t.integer :agenda_item_id
      t.string :photo
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
