Rails.application.routes.draw do
  get 'password_resets/create'

  get 'password_resets/edit'

  get 'password_resets/update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: %w[new]

  resources :sessions, only: %w[create]

  get '/signup', to: 'users#new', as: :signup
  get '/login', to: 'sessions#new', as: :login
  get '/logout', to: 'sessions#destroy', as: :logout
end
