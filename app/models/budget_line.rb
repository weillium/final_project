class BudgetLine < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :budgeted_amount, :presence => true

  # Scopes

  def to_s
    budgeted_amount
  end

end
