Rails.application.routes.draw do
  devise_for :users

  root 'equations#index'

  resources :equations, only: [:index, :show]
  resources :users, only: [:show]

  post 'equations/:id/solve' => 'equation#solve', as: :equation_solve
  get 'equations/:id/result' => 'equation#result', as: :equation_result
end
