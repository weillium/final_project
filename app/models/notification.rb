class Notification < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :body, :presence => true

  validates :creator_id, :presence => true

  validates :title, :presence => true

  # Scopes

  def to_s
    creator.to_s
  end

end
