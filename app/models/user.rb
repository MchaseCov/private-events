class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, foreign_key: :creator_id, class_name: 'Event'
  has_many :signups
  has_many :attended_events, through: :signups, source: :event

  validates :username, :email, :location, presence: true
  attr_writer :login
end
