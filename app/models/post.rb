class Post < ApplicationRecord
    MIN_LENGTH = 1

  validates :title, presence: true, length: { minimum: MIN_LENGTH }
  validates :text, presence: true, length: { minimum: MIN_LENGTH }

  belongs_to :user, class_name: "User", foreign_key: "author_id"
end
