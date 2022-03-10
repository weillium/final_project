class TagResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :photo_id, :integer
  attribute :tagged_id, :integer

  # Direct associations

  belongs_to :photo

  belongs_to :taggee,
             resource: UserResource,
             foreign_key: :tagged_id

  # Indirect associations
end
