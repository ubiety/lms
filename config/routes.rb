Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'avatar/:size/:background/:text' => Dragonfly.app.endpoint { |params, app|
    app.generate(:initial_avatar, URI.unescape(params[:text]),
                 size: params[:size], background_color: params[:background])
  }, as: :avatar

  resources :users, :courses
  resources :sessions, only: %w[create]
  resources :password_resets, only: %w[edit create update]

  get '/login', to: 'sessions#new', as: :login
  get '/logout', to: 'sessions#destroy', as: :logout

  root to: 'pages#dashboard'
end
