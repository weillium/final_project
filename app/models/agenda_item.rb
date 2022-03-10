class AgendaItem < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :is_cyoa, :presence => true

  validates :leader_id, :presence => true

  validates :location, :presence => true

  validates :start_time, :presence => true

  # Scopes

  def to_s
    start_time
  end

end
