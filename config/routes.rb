Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  root to: "apps#about"
  resources :apps do
    resources :comments, only: :create 
    resources :likes, only: [:create, :destroy] 
    collection do
      get 'about'
      get 'search'
    end
  end

end
