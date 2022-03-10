class AddTaggeeReferenceToTags < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :tags, :users, column: :tagged_id
    add_index :tags, :tagged_id
    change_column_null :tags, :tagged_id, false
  end
end
