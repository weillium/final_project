class MessageGroup < ApplicationRecord
  # Direct associations

  has_many   :group_members,
             foreign_key: "group_id",
             dependent: :destroy

  has_many   :messages,
             foreign_key: "receiver_id",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end
end
