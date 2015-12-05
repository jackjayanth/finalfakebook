class AddEventsToUser < ActiveRecord::Migration
  def change
    add_column :users, :events, :string
  end
end
