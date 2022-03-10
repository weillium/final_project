class CreateFamilies < ActiveRecord::Migration[6.0]
  def change
    create_table :families do |t|
      t.string :name
      t.string :crest
      t.text :motto

      t.timestamps
    end
  end
end
