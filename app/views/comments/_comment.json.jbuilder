json.extract! comment, :id, :commenter_id, :comment, :photo_id, :created_at,
              :updated_at
json.url comment_url(comment, format: :json)
