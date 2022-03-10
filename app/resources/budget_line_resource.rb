class BudgetLineResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :budgeted_amount, :float
  attribute :actual_amount, :float
  attribute :notes, :string
  attribute :budget_type_id, :integer

  # Direct associations

  belongs_to :budget_type

  has_many   :itineraries,
             resource: AgendaItemResource

  # Indirect associations

end
