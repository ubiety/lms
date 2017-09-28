Rails.application.routes.draw do
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection
  end

  resources :settings

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'avatar/:size/:background/:text' => Dragonfly.app.endpoint { |params, app|
    app.generate(:initial_avatar, CGI.unescape(params[:text]),
                 size: params[:size], background_color: params[:background])
  }, as: :avatar

  resources :users, concerns: :paginatable do
    resources :assignments, only: %w[show]
  end

  resources :courses do
    resources :enrolments, only: %w[new create]
    resources :assignments, except: %w[index]
  end

  resources :sessions, only: %w[create]
  resources :password_resets, only: %w[edit create update]

  get '/login', to: 'sessions#new', as: :login
  get '/logout', to: 'sessions#destroy', as: :logout

  root to: 'pages#dashboard'
end
