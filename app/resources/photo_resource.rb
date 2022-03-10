class PhotoResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :upload_user_id, :integer
  attribute :agenda_item_id, :integer
  attribute :photo, :string
  attribute :title, :string
  attribute :description, :string

  # Direct associations

  has_many   :comments

  has_many   :tags

  belongs_to :agenda_item

  belongs_to :upload_user,
             resource: UserResource

  # Indirect associations

end
