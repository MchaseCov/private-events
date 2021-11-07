class Event < ApplicationRecord
  # Associations

  belongs_to :creator, class_name: 'User'
  has_many :signups, foreign_key: :attended_event_id
  has_many :attendees, through: :signups, source: :attendee

  # Validations
  validates :name, :description, :event_date, :location, presence: true

end
