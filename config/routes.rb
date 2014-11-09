Rails.application.routes.draw do
  root 'greetings#hello'

  # application
  get 'apps' => 'application#index'
  get 'apps/dashboard' => 'application#dashboard'
  get 'apps/analysis' => 'application#analysis'
  get 'apps/reports' => 'application#reports'

  # namespace :apps, controller: "application#index" do
  #   # root to: "application#index"
  #   resources :index, :dashboard, :analysis, :reports
  # end
end
