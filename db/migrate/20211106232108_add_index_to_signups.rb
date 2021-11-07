class AddIndexToSignups < ActiveRecord::Migration[6.1]
  def change
    add_index :signups, [ :attendee_id, :attended_event_id ], unique: true, name: 'by_attendee_and_event'
  end
end
