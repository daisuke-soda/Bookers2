Rails.application.routes.draw do
  devise_for :users
  get 'home/about' => 'home#about'
  root to: "home#index"
  resources :users
  resources :books
end
