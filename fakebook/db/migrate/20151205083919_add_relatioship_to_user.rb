class AddRelatioshipToUser < ActiveRecord::Migration
  def change
    add_column :users, :relatioship, :string
  end
end
