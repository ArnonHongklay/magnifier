require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :accounts, path: 'auth'
  mount Sidekiq::Web => '/sidekiq'

  root 'landing#index'

  get "/accounts/*id" => 'pages#show',      as: :page, format: false

  get '/info'          => 'accounts#info',  as: :info, format: :json

  resources :accounts, path: '' do
    get ''                  => 'accounts#index',          as: :index
    get 'setting'           => 'accounts#setting',        as: :setting
    get 'setting/profile'   => 'accounts#profile',        as: :profile
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

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
