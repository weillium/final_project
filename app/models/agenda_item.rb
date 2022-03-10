class AgendaItem < ApplicationRecord
  # Direct associations

  has_many   :photos,
             :dependent => :destroy

  belongs_to :leader,
             :class_name => "User"

  # Indirect associations

  # Validations

  validates :activity_name, :presence => true

  validates :budget_line_id, :presence => true

  validates :description, :presence => true

  validates :end_time, :presence => true

  validates :is_cyoa, :presence => true

  validates :leader_id, :presence => true

  validates :location, :presence => true

  validates :start_time, :presence => true

  # Scopes

  def to_s
    start_time
  end

end
