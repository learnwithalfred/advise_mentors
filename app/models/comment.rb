class Comment < ApplicationRecord
  validates :text, presence: true, length: { minimum: 1 }
  # validates :author_id, presence: true
  # validates :post_id, presence: true

  belongs_to :post
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'

  after_save :update_comments_count
  def update_comments_count
    post = self.post
    post.comments_count = post.comments.count
    post.save
  end
end
