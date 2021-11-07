class AddIdToSignups < ActiveRecord::Migration[6.1]
  def change
    add_column :signups, :id, :primary_key
  end
end
