Rails.application.routes.draw do
  devise_for :users
  root to: "apps#index"
  resources :apps, only:[:index, :new, :create, :show, :edit, :update] do
    collection do
      get 'list'
      get 'list/:id', to: 'apps#show', as: 'list_app'
      patch 'list/:id', to: 'apps#update', as: 'update_list_app'
      get 'list/:id/edit', to: 'apps#edit', as: 'edit_list_app'
    end
  end

end
