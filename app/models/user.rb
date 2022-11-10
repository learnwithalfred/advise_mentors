class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable
  MAX_LENGTH = 35
  MIN_LENGTH = 3

  validates :name, presence: true, length: { maximum: MAX_LENGTH }
  validates :photo, presence: true, length: { minimum: MIN_LENGTH }
  validates :bio, presence: true, length: { minimum: MIN_LENGTH }
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  validates :post_counter, numericality: { greater_than_or_equal_to: 0 }
  enum role: %i[user admin]

  after_initialize :set_default_role, if: :new_record?
  # set default role to the user if not set
  def set_default_role
    self.role ||= :user
  end

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
