class AgendaItem < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :budget_line_id, :presence => true

  validates :description, :presence => true

  validates :end_time, :presence => true

  validates :is_cyoa, :presence => true

  validates :leader_id, :presence => true

  validates :location, :presence => true

  validates :start_time, :presence => true

  # Scopes

  def to_s
    start_time
  end

end
