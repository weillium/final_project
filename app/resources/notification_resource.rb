class NotificationResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :creator_id, :integer
  attribute :title, :string
  attribute :body, :string
  attribute :attachment, :string

  # Direct associations

  belongs_to :creator,
             resource: UserResource

  # Indirect associations
end
