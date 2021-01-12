Rails.application.routes.draw do
  devise_for :users
  get 'groups/index'
  root to: "groups#index"
  resources :users, only: [:edit, :update]
end
