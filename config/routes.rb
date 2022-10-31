Rails.application.routes.draw do
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/users/:id/posts', to: 'users#posts'
  get '/users/:id/posts/:post_id', to: 'users#post_details'
  get '/users/:id/comments', to: 'users#comments'
  get '/users/:id/likes', to: 'users#likes'
  get '/posts', to: 'posts#index'
  get '/posts/:id', to: 'posts#show'
  get '/posts/:id/comments', to: 'posts#comments'
  get '/posts/:id/likes', to: 'posts#likes'
  root "users#index"
end
