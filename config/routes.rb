Rails.application.routes.draw do
  devise_for :users
  resources :courses

  resources :classrooms do
    resources :messages
  end

  root to: "courses#index"
end
