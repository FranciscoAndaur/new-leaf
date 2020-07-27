Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :completion_dates
  resources :tasks
  resources :plants
  resources :gardens
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
