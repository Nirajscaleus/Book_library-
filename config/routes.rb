Rails.application.routes.draw do
  
  
  get "up" => "rails/health#show", as: :rails_health_check

  
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  

  root "books#index"
  resources :books


  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get '/me', to: 'users#show'
  post '/login', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy', as: 'logout'
end
