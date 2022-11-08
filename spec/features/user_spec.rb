require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before(:each) do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @post1 = FactoryBot.create(:post, author_id: @user1.id)
    @post2 = FactoryBot.create(:post, author_id: @user2.id)
    @comment1 = FactoryBot.create(:comment, author_id: @user1.id, post_id: @post1.id)
    @comment2 = FactoryBot.create(:comment, author_id: @user2.id, post_id: @post1.id)
    @like1 = FactoryBot.create(:like, author_id: @user1.id, post_id: @post1.id)
  end

  describe 'User index page' do
    before(:each) do
      visit users_path
    end

    it 'I can see the username of all other users' do
      expect(current_path).to eq(users_path)
      expect(page).to have_content @user1.name
      expect(page).to have_content @user2.name
    end

    it 'I can see the profile picture for each user' do
      expect(current_path).to eq(users_path)
      expect(page).to have_content @user1.photo
      expect(page).to have_content @user2.photo
    end

    it 'I can see the number of posts each user has written' do
      expect(current_path).to eq(users_path)
      expect(page).to have_content "Number of Post: #{@user1.post_counter}"
      expect(page).to have_content "Number of Post: #{@user2.post_counter}"
    end

    it "When I click on a user, I am redirected to that user's show page" do
      visit users_path(@user1)
      expect(page).to have_content @user1.photo
      expect(page).to have_content @user1.name
      expect(current_path).to eq(users_path(@user1))
    end
  end
end
