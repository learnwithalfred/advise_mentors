Rails.application.routes.draw do
  devise_for :users
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/users/:id/posts', to: 'users#posts'
  get '/users/:id/posts/:post_id', to: 'users#post_details'
  resources :posts
  resources :comments
  resources :likes

  root "users#index"
end
