class Event < ApplicationRecord
  validates :name, :description, :event_date, :location, presence: true

  belongs_to :creator, class_name: 'User'
  has_many :signups
  has_many :attendees, through: :signups, source: :user
end
