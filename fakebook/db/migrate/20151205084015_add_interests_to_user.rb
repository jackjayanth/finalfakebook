class AddInterestsToUser < ActiveRecord::Migration
  def change
    add_column :users, :interests, :text
  end
end
