require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, author_id: @user.id)
    @comment = FactoryBot.create(:comment, author_id: @user.id, post_id: @post.id)
    @comment = FactoryBot.create(:comment, author_id: @user2.id, post_id: @post.id)
  end

  describe 'GET /index' do
    before(:each) do
      get '/posts'
    end

    it 'return correct response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render correct template' do
      expect(response).to render_template(:index)
    end

    it 'body should includes correct placeholder text' do
      expect(response.body).to include('Post list')
    end
  end

  describe 'GET /show' do
    before(:each) do
      get "/posts/#{@post.id}"
    end

    it 'return correct response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render correct template' do
      expect(response).to render_template(:show)
    end

    it 'body should includes correct placeholder text' do
      expect(response.body).to include('Post details Page')
    end
  end
end
