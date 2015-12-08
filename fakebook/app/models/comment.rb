class Comment < ActiveRecord::Base
  belongs_to :micropost
  default_scope -> { order('created_at ASC') }
  validates :post_id, presence: true
  validates :user_id, presence: true
  validates :text, presence: true, length: { maximum: 100 }
end
