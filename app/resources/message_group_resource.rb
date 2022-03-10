class MessageGroupResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false

  # Direct associations

  has_many   :group_members,
             foreign_key: :group_id

  has_many   :messages,
             foreign_key: :receiver_id

  # Indirect associations
end
