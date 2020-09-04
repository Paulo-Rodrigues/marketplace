Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}

  authenticated :user do
    root to: 'products#index', as: :authenticated_root
  end

  get 'profile/:id', to: 'users#show', as: :profile
  get 'users', to: 'users#index'

  resources :products, only: [:index, :show, :new, :create] do
    resources :orders, only: [:create]
    resources :comments,only: [:create],  module: :products
  end

  resources :orders, only: [:show]

  resources :comments, only: [] do
    resources :comments, only: [:create], module: :comments
  end

  get 'search', to: 'search#index', as: :search

  root 'homepage#index'
end
