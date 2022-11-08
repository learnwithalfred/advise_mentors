require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before(:each) do
    @fisrt_user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @post1 = FactoryBot.create(:post, author_id: @fisrt_user.id)
    @post2 = FactoryBot.create(:post, author_id: @fisrt_user.id)
    @post3 = FactoryBot.create(:post, author_id: @fisrt_user.id)
    @post4 = FactoryBot.create(:post, author_id: @fisrt_user.id)
    @post5 = FactoryBot.create(:post, author_id: @user2.id)
    @comment1 = FactoryBot.create(:comment, author_id: @fisrt_user.id, post_id: @post1.id)
    @comment2 = FactoryBot.create(:comment, author_id: @user2.id, post_id: @post1.id)
    @like1 = FactoryBot.create(:like, author_id: @fisrt_user.id, post_id: @post1.id)
  end

  describe 'User index page' do
    before(:each) do
      visit users_path
    end

    it 'I can see the username of all other users' do
      expect(current_path).to eq(users_path)
      expect(page).to have_content @fisrt_user.name
      expect(page).to have_content @user2.name
    end

    it 'I can see the profile picture for each user' do
      expect(current_path).to eq(users_path)
      expect(page).to have_content @fisrt_user.photo
      expect(page).to have_content @user2.photo
    end

    it 'I can see the number of posts each user has written' do
      expect(current_path).to eq(users_path)
      expect(page).to have_content "Number of Post: #{@fisrt_user.post_counter}"
      expect(page).to have_content "Number of Post: #{@user2.post_counter}"
    end

    it "When I click on a user, I am redirected to that user's show page" do
      visit users_path(@fisrt_user)
      expect(page).to have_content @fisrt_user.photo
      expect(page).to have_content @fisrt_user.name
      expect(current_path).to eq(users_path(@fisrt_user))
    end
  end

  describe 'user show page' do
    before(:each) do
      visit users_path(@fisrt_user)
    end

    it 'I can see the user\'s profile picture.' do
      expect(page).to have_content @fisrt_user.photo
    end

    it 'I can see the user\'s username.' do
      expect(page).to have_content @fisrt_user.name
    end

    it 'I can see the number of posts the user has written' do
      expect(page).to have_content "Number of Post: #{@fisrt_user.post_counter}"
    end

    it 'I can see the user\'s bio.' do
      visit "users/#{@fisrt_user.id}"
      expect(page).to have_content('Bio')
    end

    it 'I can see the user\'s first 3 posts.' do
      expect(page).to have_content @post1.title
      expect(page).to have_content @post2.title
      expect(page).to have_content @post3.title
    end

    it 'When I click a user\'s post, it redirects me to that post\'s show page.' do
      visit "/users/#{@fisrt_user.id}/posts/#{@post1.id}"
      expect(page).to have_content @post1.title
    end

    it 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do
      visit "/users/#{@fisrt_user.id}/posts"
      expect(page).to have_content "All Posts from #{@fisrt_user.name}"
    end
  end
end
