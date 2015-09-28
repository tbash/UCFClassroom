Rails.application.routes.draw do
  resources :classrooms do
    resources :messages do
      collection { get :events}
    end
  end
  devise_for :users
  resources :courses
  root to: "courses#index"
end
