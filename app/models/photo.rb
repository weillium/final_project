class Photo < ApplicationRecord
  mount_base64_uploader :photo, PhotoUploader

  # Direct associations

  has_many   :comments,
             dependent: :destroy

  has_many   :tags,
             dependent: :destroy

  belongs_to :agenda_item

  belongs_to :upload_user,
             class_name: "User"

  # Indirect associations

  # Validations

  validates :agenda_item_id, presence: true

  validates :photo, presence: true

  validates :title, presence: true

  validates :upload_user_id, presence: true

  # Scopes

  def to_s
    upload_user.to_s
  end
end
