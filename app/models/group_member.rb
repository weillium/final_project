class GroupMember < ApplicationRecord
  # Direct associations

  belongs_to :group,
             :class_name => "MessageGroup"

  belongs_to :user

  # Indirect associations

  # Validations

  validates :group_id, :presence => true

  validates :user_id, :presence => true

  # Scopes

  def to_s
    group.to_s
  end

end
