Rails.application.routes.draw do
  devise_for :users

  root to: 'public#homepage'

  get '/dashboard' => 'users#index'
  resources :posts
  resources :comments, only: [:create, :destroy]
  get "profile/:username" => 'users#profile', as: :profile
  get "post/like/:post_id" => 'likes#save_like', as: :like_post
  post "follow/user" => "users#follow_user", as: :follow_user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
