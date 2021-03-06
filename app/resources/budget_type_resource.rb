class BudgetTypeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :type_name, :string

  # Direct associations

  has_many   :budgets,
             resource: BudgetLineResource

  # Indirect associations
end
