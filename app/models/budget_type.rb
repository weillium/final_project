class BudgetType < ApplicationRecord
  # Direct associations

  has_many   :budgets,
             :class_name => "BudgetLine",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :type_name, :presence => true

  # Scopes

  def to_s
    type_name
  end

end
