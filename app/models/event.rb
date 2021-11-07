class Event < ApplicationRecord
  # Scopes

  scope :past, -> { where('event_date < ?', DateTime.current) }
  scope :upcoming, -> { where('event_date >= ?', DateTime.current) }
  # Associations

  belongs_to :creator, class_name: 'User'
  has_many :signups, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :signups, source: :attendee

  # Validations
  validates :name, :description, :event_date, :location, presence: true

  # Search function
  def self.search(search)
    if search
      Event.where(location: search)
    else
      Event.all
    end
  end
end
