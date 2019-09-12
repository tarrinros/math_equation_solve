Rails.application.routes.draw do
  devise_for :users

  root 'equations#index'

  resources :equations
  resources :users, only: [:show]
end
