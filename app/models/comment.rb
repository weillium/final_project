class Comment < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :photo_id, :presence => true

  # Scopes

  def to_s
    commenter.to_s
  end

end
