Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :tweets
  resources :users
end
