Rails.application.routes.draw do
  resources :slide_containers
  resources :assignments
  resources :courses
  resources :users

  get  '/current_user',              to: 'users#current_user'
  post '/sessions',                  to: 'sessions#create'
  post '/course/:id/new_message',    to: 'courses#create_message'
  post '/course/:id/new_assignment', to: 'assignment#create'
  post 'assignment/:id/submit',      to: 'assignment#submit'
end
