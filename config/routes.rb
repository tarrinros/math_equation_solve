Rails.application.routes.draw do
  devise_for :users

  root 'equations#index'

  resources :equations, only: [:index, :show]
  resources :users, only: [:show]

  post 'equations/solve' => 'equations#solve', as: :equation_solve
  get 'equations/result' => 'equations#result', as: :equation_result
end
