class Chat < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at ASC') }
  validates :sender_id, presence: true
  validates :sender_name, presence: true
  validates :text, presence: true, length: { maximum: 100 }
end
