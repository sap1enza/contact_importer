Rails.application.routes.draw do
  root to: 'home#index'

  resources :users, only: %i[show new create]
  resources :uploads, only: %i[index]

  post   'sign_in',  to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'
end
