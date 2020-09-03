Rails.application.routes.draw do
  devise_for :users
  get 'home/about' => 'home#about'
  root to: "home#index"
  resources :users
  resources :relationships, only: [:create, :destroy]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end
