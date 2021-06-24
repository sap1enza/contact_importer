Rails.application.routes.draw do
  root to: 'home#index'

  resources :users, only: %i[new create]

  resources :imports, only: %i[new index show]

  post 'import', to: 'imports#create'
  post 'imports/get_headers', to: 'imports#get_headers'

  post   'sign_in',  to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'
end
