class Comment < ApplicationRecord
  # Direct associations

  belongs_to :commenter,
             :class_name => "User"

  # Indirect associations

  # Validations

  validates :comment, :presence => true

  validates :commenter_id, :presence => true

  validates :photo_id, :presence => true

  # Scopes

  def to_s
    commenter.to_s
  end

end
