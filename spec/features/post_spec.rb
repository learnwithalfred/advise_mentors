require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before(:each) do
    @fisrt_user = FactoryBot.create(:user)
    @post1 = FactoryBot.create(:post, author_id: @fisrt_user.id)
    @post2 = FactoryBot.create(:post, author_id: @fisrt_user.id)
    @post3 = FactoryBot.create(:post, author_id: @fisrt_user.id)
    @post4 = FactoryBot.create(:post, author_id: @fisrt_user.id)
    @post5 = FactoryBot.create(:post, author_id: @user2.id)
    @comment1 = FactoryBot.create(:comment, author_id: @fisrt_user.id, post_id: @post1.id)
    @comment2 = FactoryBot.create(:comment, author_id: @user2.id, post_id: @post1.id)
    @like1 = FactoryBot.create(:like, author_id: @fisrt_user.id, post_id: @post1.id)
  end

  describe 'Post index page' do
    # before(:each) do
    # end

    it 'I can see the user\'s profile picture' do
      visit user_posts_path

      expect(current_path).to eq(users_posts_path)
      expect(page).to have_content @fisrt_user.photo
    end
    it 'I can see the user\'s name ' do
      visit user_posts_path

      expect(current_path).to eq(users_posts_path)
      expect(page).to have_content @fisrt_user.name
    end
    it 'I can see the number of posts of a user has writen' do
      visit user_posts_path

      expect(current_path).to eq(users_posts_path)
      expect(page).to have_content @fisrt_user.post_counter
    end
    it 'I can see the posts title' do
      visit user_posts_path

      expect(current_path).to eq(users_posts_path)
      expect(page).to have_content @post1.title
    end
    it 'I can see the posts body' do
      visit user_posts_path

      expect(current_path).to eq(users_posts_path)
      expect(page).to have_content @post1.text
    end
    it 'I can see the first comment of post' do
      visit user_posts_path

      expect(current_path).to eq(users_posts_path)
      expect(page).to have_content @post1.comments.first
    end
    it 'I can see how many comments the post has' do
      visit user_posts_path

      expect(current_path).to eq(users_posts_path)
      expect(page).to have_content @post1.comment_counter
    end
    it 'I can see how many likes the post has' do
      visit user_posts_path

      expect(current_path).to eq(users_posts_path)
      expect(page).to have_content @post1.like_counter
    end
    it 'When I click on a post, it redirects me to that post\'s show page' do
      visit "/users/#{@post1.id}/posts"
      expect(page).to have_content "All Posts from #{@post1.title}"
    end
  end
end
