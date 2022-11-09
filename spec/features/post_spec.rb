require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before(:each) do
    @fisrt_user = FactoryBot.create(:user)
    @post1 = FactoryBot.create(:post, author_id: @fisrt_user.id)
    @comment1 = FactoryBot.create(:comment, author_id: @fisrt_user.id, post_id: @post1.id)
    @like1 = FactoryBot.create(:like, author_id: @fisrt_user.id, post_id: @post1.id)
  end

  describe 'Post index page' do
    before(:each) do
      visit "/users/#{@fisrt_user.id}/posts"
    end
    it 'I can see the user\'s profile picture' do
      expect(page).to have_content @fisrt_user.photo
    end
    it 'I can see the user\'s username ' do
      expect(page).to have_content @fisrt_user.name
    end
    it 'I can see the number of posts of a user has writen' do
      expect(page).to have_content @fisrt_user.posts.count
    end
    it 'I can see the posts title' do
      visit "/users/#{@fisrt_user.id}/posts"
      expect(page).to have_content @post1.title
    end
    it 'I can see the posts body' do
      expect(page).to have_content @post1.text
    end
    it 'I can see the first comment of post' do
      visit "/users/#{@fisrt_user.id}/posts"
      expect(page).to have_content @comment1.text
    end
    it 'I can see how many comments the post has' do
      visit "/users/#{@fisrt_user.id}/posts"
      expect(page).to have_content @post1.comments.count
    end
    it 'I can see how many likes the post has' do
      visit "/users/#{@fisrt_user.id}/posts"
      expect(page).to have_content @post1.likes.count
    end
    it 'When I click on a post, it redirects me to that post\'s show page' do
      visit "/users/#{@fisrt_user.id}/posts/#{@post1.id}"
      expect(page).to have_content @post1.title
    end
  end

  describe 'Post show page' do
    before(:each) do
      visit "/users/#{@fisrt_user.id}/posts/#{@post1.id}"
    end
    it "I can see the post's title" do
      expect(page).to have_content @post1.title
    end
    it 'I can see who wrote the post' do
      expect(page).to have_content @fisrt_user.name
    end

    it "I can see the post's body" do
      expect(page).to have_content @post1.text
    end

    it 'I can see how many likes it has' do
      expect(page).to have_content @post1.likes.count
    end

    it 'I can see the username of each commentor' do
      expect(page).to have_content @comment1.user.name
    end

    it 'I can see the comment each commentor left' do
      expect(page).to have_content @comment1.text
    end
  end
end