require "open-uri"
class AgendaItem < ApplicationRecord
  before_validation :geocode_location

  def geocode_location
    if location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_base64_uploader :photo, PhotoUploader

  # Direct associations

  belongs_to :budget_line

  has_many   :photos,
             dependent: :destroy

  belongs_to :leader,
             class_name: "User"

  # Indirect associations

  # Validations

  validates :activity_name, presence: true

  validates :budget_line_id, presence: true

  validates :description, presence: true

  validates :end_time, presence: true

  validates :is_cyoa, presence: true

  validates :leader_id, presence: true

  validates :location, presence: true

  validates :start_time, presence: true

  # Scopes

  def to_s
    start_time
  end
end
