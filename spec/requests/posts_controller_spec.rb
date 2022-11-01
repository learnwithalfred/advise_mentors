require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(name: 'Tom Nath', photo: 'https://picsum.photos/208', bio: 'I love coding rails',
                        post_counter: 0)
    @post = Post.create(
      author_id: @user.id,
      title: 'Post title',
      text: 'Post text'
    )
    Comment.create(author_id: @user.id, post: @post, text: 'This is great')
    Comment.create(author_id: @user.id, post: @post, text: 'Testing')
    Comment.create(author_id: @user.id, post: @post, text: 'I love this test')
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
