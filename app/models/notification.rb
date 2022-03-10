class Notification < ApplicationRecord
  # Direct associations

  belongs_to :creator,
             :class_name => "User"

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
