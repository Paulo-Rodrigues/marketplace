Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}

  get 'profile/:id', to: 'users#show', as: :profile

  root 'homepage#index'
end
