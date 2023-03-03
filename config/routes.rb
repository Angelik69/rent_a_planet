Rails.application.routes.draw do
  devise_for :users
  root to: "planets#landing"
  # get "landing", to: "planets#index"
  resources :planets do
    collection do
      get :user
    end
    resources :reservations, only: %i[create]
  end
  resources :reservations, only: %i[index destroy]
end
