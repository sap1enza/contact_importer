Rails.application.routes.draw do
  root to: 'home#index'

  resources :users, only: %i[show new create]

  post   'sign_in',  to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'
end
