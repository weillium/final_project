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

  # Indirect associations

end
