class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.integer :photo_id
      t.integer :tagged_id

      t.timestamps
    end
  end
end
