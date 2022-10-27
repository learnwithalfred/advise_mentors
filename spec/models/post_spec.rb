require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'post should have valid attributes' do
    post = FactoryBot.build(:post)

    it 'expect post to be valid with valid input filds' do
      expect(post).to be_valid
    end
  end
  it 'post should not be valid without a title' do
    post = FactoryBot.build(:post, title: '')
    expect(post).to_not be_valid
  end

  it 'post cannot exceed max length' do
    post = FactoryBot.build(:post, title: 'a' * (Post::MAX_LENGTH + 1))
    expect(post).to_not be_valid
  end

  it 'comment_counter must be greater than 0' do
    post = FactoryBot.build(:post, comments_count: -1)
    expect(post).to_not be_valid
  end
end
