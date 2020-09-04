Rails.application.routes.draw do
  devise_for :users
  get 'home/about' => 'home#about'
  get 'search' => 'search#search', as: 'search'
  root to: "home#index"
  resources :users,only: [:show,:index,:edit,:update,:create] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end
