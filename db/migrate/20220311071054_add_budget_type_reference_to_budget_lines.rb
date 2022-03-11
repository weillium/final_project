class AddBudgetTypeReferenceToBudgetLines < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :budget_lines, :budget_types
    add_index :budget_lines, :budget_type_id
    change_column_null :budget_lines, :budget_type_id, false
  end
end
