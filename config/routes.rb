Rails.application.routes.draw do
  namespace :admin do
    root to: 'admin#index'
  end

  devise_for :users, controllers: {registrations: 'registrations'}

  authenticated :user do
    root to: 'products#index', as: :authenticated_root
  end

  get 'profile/:id', to: 'users#show', as: :profile
  get 'users', to: 'users#index'

  resources :users, only: [] do
    resources :reports, only: [:new, :create], module: :users
  end

  resources :categories, only: [:show]

  resources :products, only: [:index, :show, :new, :create, :edit, :update] do
    resources :orders, only: [:create]
    resources :comments,only: [:create],  module: :products
    resources :reports, only: [:new, :create], module: :products
    member do
      put 'suspend'
      put 'activate'
    end
  end

  resources :favorites, only: [:index, :create, :destroy]

  resources :orders, only: [:index, :show, :edit, :update] do
    resources :messages, only: [:create]
    member do
      post 'cancel'
    end
  end

  resources :notifications, only: [:index]

  resources :comments, only: [] do
    resources :comments, only: [:create], module: :comments
  end

  get 'search', to: 'search#index', as: :search

  root 'homepage#index'
end
