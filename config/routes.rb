Rails.application.routes.draw do
  devise_for :users
  get 'groups/index'
  root to: "groups#index"
  resources :users, only: [:edit, :update]
  resources :groups, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :posts
  end

end
