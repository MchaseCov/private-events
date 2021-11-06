class CreateSignups < ActiveRecord::Migration[6.1]
  def change
    create_table :signups, id: false do |t|
      t.belongs_to :user
      t.belongs_to :event
      t.timestamps
    end
  end
end
