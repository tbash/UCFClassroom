Rails.application.routes.draw do
  resources :channels do
    resources :messages
  end
  devise_for :users
  resources :courses
  root to: "courses#index"
end
