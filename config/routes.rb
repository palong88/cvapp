Rails.application.routes.draw do

  resources :cvs
  resources :candidates
  resources :jobs
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :accounts
  root to: "home#index"

end
