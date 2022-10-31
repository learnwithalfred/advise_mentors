require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'comment should have valid attributes' do
    post = FactoryBot.create(:post)
    user = FactoryBot.create(:user)
    comment = FactoryBot.build(:comment, author_id: user.id, post_id: post.id)

    it 'expect comment to be valid with valid input filds' do
      expect(comment).to be_valid
    end

    it 'comment should have a post_id' do
      comment = FactoryBot.build(:comment, author_id: user.id, post_id: nil)
      expect(comment).to_not be_valid
    end

    it 'comment should have a author_id' do
      comment = FactoryBot.build(:comment, post_id: post.id, author_id: nil)
      expect(comment).to_not be_valid
    end

    it 'comment should have text' do
      comment = FactoryBot.build(:comment, post_id: post.id, author_id: user.id, text: '')
      expect(comment).to_not be_valid
    end
  end
end
