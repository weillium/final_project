class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.integer :family_id
      t.integer :score
      t.text :description

      t.timestamps
    end
  end
end
