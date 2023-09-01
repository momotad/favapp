Rails.application.routes.draw do
  devise_for :users
  root to: "apps#about"
  resources :apps do
    resource :comments, only: :create 
    resource :likes, only: [:create, :destroy] 
    collection do
      get 'about'
      get 'search'
    end
  end
  resources :users, only: [:edit, :update]
end
