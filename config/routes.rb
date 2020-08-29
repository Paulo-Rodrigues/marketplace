Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}

  authenticated :user do
    root to: 'products#index', as: :authenticated_root
  end

  get 'profile/:id', to: 'users#show', as: :profile
  get 'users', to: 'users#index'

  resources :products, only: [:index, :show, :new, :create]

  root 'homepage#index'
end
