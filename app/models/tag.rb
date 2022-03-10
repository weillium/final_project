class Tag < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :tagged_id, :presence => true

  # Scopes

  def to_s
    photo.to_s
  end

end
