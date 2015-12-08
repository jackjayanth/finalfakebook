class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :sender_id
      t.string :sender_name
      t.string :text

      t.timestamps null: false
    end
  end
end
