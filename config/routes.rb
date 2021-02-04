Rails.application.routes.draw do
  devise_for :users

  root to: 'public#homepage'

  get '/dashboard' => 'users#index'
  resources :posts

  get "profile/:username" => 'users#profile', as: :profile
  get "post/like/:post_id" => 'likes#save_like', as: :like_post


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
