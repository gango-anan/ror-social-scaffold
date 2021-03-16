Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users
  resources :users, only: [:index, :show] do
    resources :bonds, only: [:index, :update, :destroy]
  end
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  post 'invite' => 'bonds#create', as: 'invite_to_friendship'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
