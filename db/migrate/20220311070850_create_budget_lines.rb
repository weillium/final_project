class CreateBudgetLines < ActiveRecord::Migration[6.0]
  def change
    create_table :budget_lines do |t|
      t.float :budgeted_amount
      t.float :actual_amount
      t.text :notes
      t.integer :budget_type_id

      t.timestamps
    end
  end
end
