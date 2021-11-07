class Signup < ActiveRecord::Base
  self.primary_key = 'id'

  # Associations
  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'

  # Validations
  validates :attendee_id, :attended_event_id, presence: true

  # Callbacks
  around_save :catch_uniqueness_exception

  private

  # Prevent somebody from signing up for the same event twice
  def catch_uniqueness_exception
    yield
  rescue ActiveRecord::RecordNotUnique
    Signup.errors.add(:meter, :taken)
  end
end
