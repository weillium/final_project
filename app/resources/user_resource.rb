class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :user_type_id, :integer
  attribute :family_id, :integer
  attribute :phone_number, :string
  attribute :dietary_restrictions, :string
  attribute :adventure_score, :integer
  attribute :freetime_score, :integer
  attribute :beachwater_score, :integer
  attribute :nightlife_score, :integer
  attribute :headshot, :string
  attribute :walkup_song, :string

  # Direct associations

  belongs_to :family

  belongs_to :user_type

  has_many   :group_members

  has_many   :notifications,
             foreign_key: :creator_id

  has_many   :messages,
             foreign_key: :sender_id

  has_many   :tags,
             foreign_key: :tagged_id

  has_many   :comments,
             foreign_key: :commenter_id

  has_many   :photos,
             foreign_key: :upload_user_id

  has_many   :agenda_items,
             foreign_key: :leader_id

  # Indirect associations

end
