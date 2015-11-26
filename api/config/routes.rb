Rails.application.routes.draw do
  resources :slides
  resources :assignments
  resources :messages
  resources :courses
  resources :users

  get  '/current_user', to: 'users#current_user'
  post '/sessions',     to: 'sessions#create'
end
