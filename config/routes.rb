Rails.application.routes.draw do

  root 'static#index'
  resources :comments
  resources :posts
  resources :workouts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
