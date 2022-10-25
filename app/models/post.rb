class Post < ApplicationRecord
    MAX_LENGTH = 35
    MIN_LENGTH = 3

  validates :title, presence: true, length: { maximum: MAX_LENGTH }
  validates :text, presence: true, length: { minimum: MIN_LENGTH }

  belongs_to :user, class_name: "User", foreign_key: "author_id"
end
