Rails.application.routes.draw do
devise_for :users, path: "auth",
    path_names: {
      sign_in: "login",
      sign_out: "logout",
      password: "secret",
      confirmation: "verification",
      unlock: 'unblock',
      registration: 'register',
      sign_up: 'cmon_let_me_in'
  }  
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/users/:id/posts', to: 'users#posts'
  get '/users/:id/posts/:post_id', to: 'users#post_details'
  resources :posts
  resources :comments
  resources :likes

  root "users#index"
end
