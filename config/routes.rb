Rails.application.routes.draw do
  root 'greetings#hello'

  get 'apps' => 'application#index'
  namespace :apps do
    resources :index, :dashboard, :analysis, :reports
  end
end
