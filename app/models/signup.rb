class Signup < ActiveRecord::Base
  # Associations
  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'

  # Validations 
  validates :attendee_id, :attended_event_id, presence: true

  # Callbacks
  around_save :catch_uniqueness_exception

  private

  def catch_uniqueness_exception
    yield
  rescue ActiveRecord::RecordNotUnique
    self.errors.add(:meter, :taken)
  end
end
