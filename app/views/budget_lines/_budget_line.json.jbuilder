json.extract! budget_line, :id, :budgeted_amount, :actual_amount, :notes, :budget_type_id, :created_at, :updated_at
json.url budget_line_url(budget_line, format: :json)
