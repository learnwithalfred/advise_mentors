class User < ApplicationRecord
    MAX_LENGTH = 35
    MIN_LENGTH = 3

    validates :name, presence: true, length: { maximum: MAX_LENGTH }
    validates :photo, presence: true, length: { minimum: MIN_LENGTH }
    validates :bio, presence: true, length: { minimum: MIN_LENGTH }

end
