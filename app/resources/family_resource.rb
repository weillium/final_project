class FamilyResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :crest, :string
  attribute :motto, :string

  # Direct associations

  has_many   :scores

  has_many   :users

  # Indirect associations

end
