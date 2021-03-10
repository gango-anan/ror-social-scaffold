Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users
  get 'users/friends'
  get 'users/incoming_requests'
  get 'users/outgoing_requests'
  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  resources :bonds, only: [:create, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
