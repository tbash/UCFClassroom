Rails.application.routes.draw do
  devise_for :users
  resources :courses

  resources :classrooms do
    resources :messages do
      collection { get :events}
    end
  end

  root to: "courses#index"
end
