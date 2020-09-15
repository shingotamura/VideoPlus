Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'about', to: 'misc#about'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create, :edit, :update] do
    member do
      get :followings
      get :followers
      get :profiles
    end
  end
  resources :machines, only: [:show]
  resources :relationship_of_follows, only: [:create, :destroy]
  resources :videoposts, only: [:new, :create, :destroy]
  
  
end
