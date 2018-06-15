Rails.application.routes.draw do
  resources :asset_sensor_data do
    collection {post :import}
  end

  resources :machine_assets
  root "asset#index"
  resources :tests
  resources :dash

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :accounts



end
