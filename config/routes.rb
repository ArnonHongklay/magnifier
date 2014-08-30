Rails.application.routes.draw do
  get '/' => 'landing#index'
  get 'application' => 'application#index'
end
