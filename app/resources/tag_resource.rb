class TagResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :photo_id, :integer
  attribute :tagged_id, :integer

  # Direct associations

  # Indirect associations

end
