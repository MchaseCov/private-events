class RemoveTimestampsFromSignups < ActiveRecord::Migration[6.1]
  def change
    remove_column :signups, :created_at
    remove_column :signups, :updated_at
  end
end
