class Photo < ApplicationRecord
  # Direct associations

  belongs_to :agenda_item

  belongs_to :upload_user,
             :class_name => "User"

  # Indirect associations

  # Validations

  validates :agenda_item_id, :presence => true

  validates :photo, :presence => true

  validates :title, :presence => true

  validates :upload_user_id, :presence => true

  # Scopes

  def to_s
    upload_user.to_s
  end

end
