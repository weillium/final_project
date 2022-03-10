json.extract! photo, :id, :upload_user_id, :agenda_item_id, :photo, :title,
              :description, :created_at, :updated_at
json.url photo_url(photo, format: :json)
