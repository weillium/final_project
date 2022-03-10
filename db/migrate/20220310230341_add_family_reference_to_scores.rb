class AddFamilyReferenceToScores < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :scores, :families
    add_index :scores, :family_id
    change_column_null :scores, :family_id, false
  end
end
