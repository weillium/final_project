class UserType < ApplicationRecord
  # Direct associations

  has_many   :users,
             dependent: :destroy

  # Indirect associations

  # Validations

  validates :type_name, presence: true

  # Scopes

  def to_s
    type_name
  end
end
