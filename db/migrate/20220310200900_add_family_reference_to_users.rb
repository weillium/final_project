class AddFamilyReferenceToUsers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :users, :families
    add_index :users, :family_id
    change_column_null :users, :family_id, false
  end
end
