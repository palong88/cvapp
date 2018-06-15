Rails.application.routes.draw do
  resources :machine_assets
  root "home#index"
  resources :tests
  resources :dash
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :accounts



end
