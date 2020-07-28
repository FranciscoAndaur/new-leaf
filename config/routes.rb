Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/register', to: 'users#create'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :completion_dates
  resources :tasks
  resources :plants
  resources :gardens
  resources :users
  get '/settings', to: "users#settings", as: "settings"
  root 'newleaf#landing'

  get '/garden', to: 'gardens#garden'
  get '/home', to: 'users#home'
  # get 'garden', to: 'gardens#garden'

  # get 'garden', to: 'gardens#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
