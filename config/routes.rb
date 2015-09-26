require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :accounts,
    path: 'session',
    controllers: {
      registrations:  'accounts/registrations',
      sessions:       'accounts/sessions',
      passwords:      'accounts/passwords',
      confirmations:  'accounts/confirmations'
    }

  mount Sidekiq::Web => '/sidekiq'

  root 'landing#index'

  get "/accounts/*id"   => 'pages#show',        as: :page, format: false
  get '/profile'        => 'accounts#profile',  as: :profile

  resources :accounts, path: '', constraints: { path: /(?!(websocket)\z).*/ }  do
    get     'index'               => 'accounts#index',            as: :index
    get     'setting'             => 'accounts#setting',          as: :setting
    put     'setting_update'      => 'accounts#setting_update'
    post    'setting_ip_create'   => 'accounts#setting_ip_create'
    delete  'setting_ip_delete'   => 'accounts#setting_ip_delete'
    get     'community'           => 'conversation#index',        as: :community
    get     'report'              => 'report#index',              as: :report
    # get 'report/information'  => 'report#information',      as: :report_information
    # get 'report/warning'      => 'report#warning',          as: :report_warning
    # get 'dashboard'           => 'dashboard#index',         as: :dashboard
    # get 'monitoring-tools'    => 'monitoring_tools#index',  as: :monitoring_tools
    # get 'ticket-support'      => 'ticket_support#index',    as: :ticket_support
    get     'events'              => 'events#index'

    # resources :community
    resources :dashboard do
      collection { get :events }
    end
    # resources :report
    # resources :monitoring_tools
    # resources :ticket_support
  end
end
