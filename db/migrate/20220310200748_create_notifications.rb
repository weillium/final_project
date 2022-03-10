class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :creator_id
      t.string :title
      t.string :body
      t.string :attachment

      t.timestamps
    end
  end
end
