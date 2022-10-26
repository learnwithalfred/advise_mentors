class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'

  private

  after_save :update_likes_count
  def update_likes_count
    post = self.post
    post.likes_count = post.likes.count
    post.save
  end
end
