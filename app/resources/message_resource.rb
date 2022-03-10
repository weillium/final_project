class MessageResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :sender_id, :integer
  attribute :receiver_id, :integer
  attribute :body, :string
  attribute :attachment, :string

  # Direct associations

  belongs_to :receiver,
             resource: MessageGroupResource

  belongs_to :sender,
             resource: UserResource

  # Indirect associations
end
