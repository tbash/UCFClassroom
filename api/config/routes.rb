Rails.application.routes.draw do
  resources :assignments
  resources :messages
  resources :slides
  resources :courses
  resources :users

  post '/session',  to: 'sessions#create'
end
