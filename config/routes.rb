Rails.application.routes.draw do
  root 'admin#index'

  get 'admin' => 'admin#index'
  get 'admin/dashboard' => 'admin#dashboard'
  get 'admin/analysis' => 'admin#analysis'
  get 'admin/reports' => 'admin#reports'
end
