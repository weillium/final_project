class Notification < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :title, :presence => true

  # Scopes

  def to_s
    creator.to_s
  end

end
