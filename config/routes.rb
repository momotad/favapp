Rails.application.routes.draw do
  devise_for :users
  root to: "apps#index"
  resources :apps, only:[:index, :new, :create]
end
