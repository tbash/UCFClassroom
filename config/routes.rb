Rails.application.routes.draw do
  resources :messenges
  resources :channels
  devise_for :users
  resources :courses
  root to: "courses#index"
end
