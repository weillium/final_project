class MessageGroup < ApplicationRecord
  # Direct associations

  has_many   :messages,
             :foreign_key => "receiver_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
