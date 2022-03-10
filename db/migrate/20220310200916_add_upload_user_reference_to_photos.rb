class AddUploadUserReferenceToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :photos, :users, column: :upload_user_id
    add_index :photos, :upload_user_id
    change_column_null :photos, :upload_user_id, false
  end
end
