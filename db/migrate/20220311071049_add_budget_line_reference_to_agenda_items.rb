class AddBudgetLineReferenceToAgendaItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :agenda_items, :budget_lines
    add_index :agenda_items, :budget_line_id
    change_column_null :agenda_items, :budget_line_id, false
  end
end
