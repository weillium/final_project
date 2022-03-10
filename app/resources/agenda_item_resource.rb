class AgendaItemResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :start_time, :datetime
  attribute :end_time, :datetime
  attribute :location, :string
  attribute :activity_name, :string
  attribute :description, :string
  attribute :photo, :string
  attribute :leader_id, :integer
  attribute :is_cyoa, :boolean
  attribute :budget_line_id, :integer

  # Direct associations

  belongs_to :leader,
             resource: UserResource

  # Indirect associations

end
