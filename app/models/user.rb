class User < ApplicationRecord
  # Devise
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :created_events, foreign_key: :creator_id, class_name: 'Event'
  has_many :signups, foreign_key: :attendee_id,  dependent: :destroy
  has_many :attended_events, through: :signups, source: :attended_event

  # Validations
  validates :username, :email, :location, presence: true

  attr_writer :login
end
