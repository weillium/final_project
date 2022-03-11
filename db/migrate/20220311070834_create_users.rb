class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :user_type_id
      t.integer :family_id
      t.string :phone_number
      t.text :dietary_restrictions
      t.integer :adventure_score
      t.integer :freetime_score
      t.integer :beachwater_score
      t.integer :nightlife_score
      t.string :headshot
      t.string :walkup_song

      t.timestamps
    end
  end
end
