json.extract! agenda_item, :id, :start_time, :end_time, :location, :activity_name, :description, :photo, :leader_id, :is_cyoa, :budget_line_id, :created_at, :updated_at
json.url agenda_item_url(agenda_item, format: :json)
