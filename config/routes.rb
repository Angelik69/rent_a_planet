Rails.application.routes.draw do
  devise_for :users
  get "landing", to: "planets#landing"
  root to: "planets#landing"
  resources :planets do
    collection do
      get :user
    end
    resources :reservations, only: %i[create]
  end
  resources :reservations, only: %i[index destroy]
end
