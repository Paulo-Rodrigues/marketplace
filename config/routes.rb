Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}

  get 'profile/:id', to: 'users#show', as: :profile

  resources :products, only: [:index, :show]

  root 'homepage#index'
end
