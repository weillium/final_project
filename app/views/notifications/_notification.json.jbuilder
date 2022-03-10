json.extract! notification, :id, :creator_id, :title, :body, :attachment,
              :created_at, :updated_at
json.url notification_url(notification, format: :json)
