class Post < ApplicationRecord
  MIN_LENGTH = 1
  MAX_LENGTH = 250

  validates :title, presence: true, length: { minimum: MIN_LENGTH, maximum: MAX_LENGTH }
  validates :text, presence: true, length: { minimum: MIN_LENGTH }

  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :comments_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  after_save :update_posts_counter
  def update_posts_counter
    user = self.user
    user.post_counter = user.posts.count
    user.save
  end
end
