class User < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :phone_number, :presence => true

  validates :user_type_id, :presence => true

  validates :walkup_song, :presence => true

  # Scopes

  def to_s
    created_at
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
