Rails.application.routes.draw do
  devise_for :users
  root to: "apps#index"
  resources :apps, only:[:index, :new, :create] do
    collection do
      get 'list'
      get 'list/:id', to: 'apps#show', as: 'list_app'
    end
  end

end
