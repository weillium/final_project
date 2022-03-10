class GroupMember < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :user_id, :presence => true

  # Scopes

  def to_s
    group.to_s
  end

end
