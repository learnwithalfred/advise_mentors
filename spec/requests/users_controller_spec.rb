require 'rails_helper'

RSpec.describe UsersController, type: :request do
  before(:each) do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, author_id: @user.id)
    @comment1 = FactoryBot.create(:comment, author_id: @user.id, post_id: @post.id)
    @comment2 = FactoryBot.create(:comment, author_id: @user.id, post_id: @post.id)
    @like = FactoryBot.create(:like, author_id: @user.id, post_id: @post.id)
  end

  describe "GET 'index' page" do
    before(:example) do
      get '/users'
    end

    it 'return correct response' do
      expect(response).to have_http_status(:ok)
    end
    it 'should render correct template' do
      expect(response).to render_template(:index)
    end
    it 'The response body should have the correct placeholder text' do
      expect(response.body).to include('Users list')
    end
  end

  describe "GET 'show' page" do
    before(:example) do
      get "/users/#{@user.id}"
    end

    it 'return correct response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render correct template' do
      expect(response).to render_template(:show)
    end

    it 'body should includes correct placeholder text' do
      expect(response.body).to include(@user.name)
    end
  end

  describe 'Get post from one user' do
    before(:example) do
      get "/users/#{@user.id}/posts"
    end

    it 'return correct response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render correct template' do
      expect(response).to render_template(:posts)
    end

    it 'body should includes correct placeholder text' do
      expect(response.body).to include('Number of post')
    end
  end

  describe 'Get post from one user details page' do
    before(:example) do
      get "/users/#{@user.id}/posts/#{@post.id}"
    end

    it 'return correct response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render correct template' do
      expect(response).to render_template(:post_details)
    end

    it 'body should includes correct placeholder text' do
      expect(response.body).to include('Post content')
    end
  end
end
