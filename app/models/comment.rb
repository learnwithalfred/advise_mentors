class Comment < ApplicationRecord
  validates :text, presence: true, length: { minimum: 1 }
  belongs_to :post
  belongs_to :user, class_name: "User", foreign_key: "author_id"

end
