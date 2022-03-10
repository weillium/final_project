class Score < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :score, :presence => true

  # Scopes

  def to_s
    family.to_s
  end

end
