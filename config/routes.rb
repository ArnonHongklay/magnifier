require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :accounts, path: 'auth',
    controllers: {
      registrations: 'accounts/registrations'
    }
  mount Sidekiq::Web => '/sidekiq'
  match "/websocket", to: WebsocketRails::ConnectionManager.new, via: [:get, :post]

  root 'landing#index'

  get "/accounts/*id"   => 'pages#show',        as: :page, format: false
  get '/profile'        => 'accounts#profile',  as: :profile

  resources :accounts, path: '', constraints: { path: /(?!(websocket)\z).*/ }  do
    get 'index'             => 'accounts#index',          as: :index
    get 'setting'           => 'accounts#setting',        as: :setting
    get 'community'         => 'conversation#index',      as: :community
    get 'report'            => 'report#index',            as: :report
    get 'dashboard'         => 'dashboard#index',         as: :dashboard
    get 'monitoring-tools'  => 'monitoring_tools#index',  as: :monitoring_tools
    get 'ticket-support'    => 'ticket_support#index',    as: :ticket_support

    # resources :community
    # resources :dashboard
    # resources :report
    # resources :monitoring_tools
    # resources :ticket_support
  end
end
