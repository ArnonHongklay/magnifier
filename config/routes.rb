Rails.application.routes.draw do

  root  'landing#index'
  get 'home' => 'landing#index'
  get 'app' => 'application#index'
end
