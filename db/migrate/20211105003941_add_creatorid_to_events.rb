class AddCreatoridToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :creator_id, :integer
    add_index :events, :creator_id
    add_foreign_key :events, :users, column: :creator_id
  end
end
