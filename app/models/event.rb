class Event < ApplicationRecord
  validates :name, :description, :event_date, :location, presence: true
  belongs_to :creator, class_name: 'User'
end
