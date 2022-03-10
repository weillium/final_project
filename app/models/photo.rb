class Photo < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :upload_user_id, :presence => true

  # Scopes

  def to_s
    upload_user.to_s
  end

end
