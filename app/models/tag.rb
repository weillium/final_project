class Tag < ApplicationRecord
  # Direct associations

  belongs_to :taggee,
             :class_name => "User",
             :foreign_key => "tagged_id"

  # Indirect associations

  # Validations

  validates :photo_id, :presence => true

  validates :tagged_id, :presence => true

  # Scopes

  def to_s
    photo.to_s
  end

end
