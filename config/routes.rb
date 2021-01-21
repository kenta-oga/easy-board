Rails.application.routes.draw do
  devise_for :users
  root to: "groups#index"
  resources :users, only: [:edit, :update]
  resources :groups, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :posts do
      resources :comments, only: [:new, :create, :destroy]
    end
  end

end
