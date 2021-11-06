class ChangeColumnNameSignins < ActiveRecord::Migration[6.1]
  def change
    rename_column :signups, :user_id, :attendee_id
    rename_column :signups, :event_id, :attended_event_id
  end
end
