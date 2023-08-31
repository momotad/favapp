Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  root to: "apps#index"
  resources :likes, only: [:create, :destroy]
  resources :comments, only: :create
  resources :apps do
    collection do
      get 'list'
      get 'list/:id', to: 'apps#show', as: 'list_app'
      # get 'list/:id/comments', to: 'apps#show', as: 'app_comments'
      patch 'list/:id', to: 'apps#update', as: 'update_list_app'
      delete 'list/:id', to: 'apps#destroy', as: 'destroy_list_app'
      post 'list/:id', to: 'likes#create', as: 'like_create_list_app'
      delete 'list/:id/like', to: 'likes#destroy', as: 'like_destroy_list_app'
      get 'list/:id/edit', to: 'apps#edit', as: 'edit_list_app'
      post 'list/:id/comment', to: 'comments#create', as: 'comment_create_list_app'
      get 'search'
    end
  end

end
