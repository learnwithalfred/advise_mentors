require 'swagger_helper'

RSpec.describe 'api/posts', type: :request do
    before(:each) do
        @user = FactoryBot.create(:user)
        # @user2 = FactoryBot.create(:user)
        # @post = FactoryBot.create(:post, author_id: @user.id)
        # @comment = FactoryBot.create(:comment, author_id: @user.id, post_id: @post.id)
        # @comment = FactoryBot.create(:comment, author_id: @user2.id, post_id: @post.id)
      end
    describe 'Posts API' do

        path 'users/:id/posts' do
      
          post 'Creates a post' do
            tags 'Posts'
            consumes 'application/json'
            parameter name: :post, in: :body, schema: {
              type: :object,
              properties: {
                title: { type: :string },
                text: { type: :string }
              },
              required: [ 'title', 'text' ]
            }
      
            response '201', 'Post saved!' do
              let(:post) { { title: 'foo', text: 'bar', post_counter: 0 } }
              run_test!
            end
      
            response '422', 'Please fill all fields' do
              let(:post) { { title: 'foo' } }
              run_test!
            end
          end
        end
      
        path 'users/:id/posts/:id' do
      
          get 'Retrieves a post' do
            tags 'Posts', 'Another Tag'
            produces 'application/json', 'application/xml'
            parameter name: :id, in: :path, type: :string
      
            response '200', 'post found' do
              schema type: :object,
                properties: {
                  id: { type: :integer },
                  title: { type: :string },
                  text: { type: :string }
                },
                required: [ 'id', 'title', 'text' ]
      
              let(:id) { Post.create(title: 'foo', text: 'bar').id }
              run_test!
            end
      
            response '404', 'post not found' do
              let(:id) { 'invalid' }
              run_test!
            end
      
            response '406', 'unsupported accept header' do
              let(:'Accept') { 'application/foo' }
              run_test!
            end
          end
        end
      end
end
