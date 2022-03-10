class ScoreResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :family_id, :integer
  attribute :score, :integer
  attribute :description, :string

  # Direct associations

  belongs_to :family

  # Indirect associations
end
