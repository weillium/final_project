class AgendaItem < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :start_time, :presence => true

  # Scopes

  def to_s
    start_time
  end

end
