require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'like should have valid attributes' do
    post = FactoryBot.create(:post)
    user = FactoryBot.create(:user)
    like = Like.new(author_id: user.id, post_id: post.id)

    it 'expect like to be valid with valid input filds' do
      expect(like).to be_valid
    end

    it 'like should have a post_id' do
      like = Like.new(author_id: user.id)
      expect(like).to_not be_valid
    end

    it 'like should have a author_id' do
      like = Like.new(post_id: post.id)
      expect(like).to_not be_valid
    end
  end
end
