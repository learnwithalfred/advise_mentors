class Post < ApplicationRecord
  MIN_LENGTH = 1

  validates :title, presence: true, length: { minimum: MIN_LENGTH }
  validates :text, presence: true, length: { minimum: MIN_LENGTH }

  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
  
  after_save :update_posts_counter
  def update_posts_counter
    user = self.user
    user.post_counter = user.posts.count
    user.save
  end
end
