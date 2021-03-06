class UserTypeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :type_name, :string

  # Direct associations

  has_many :users

  # Indirect associations
end
