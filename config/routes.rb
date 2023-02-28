Rails.application.routes.draw do
  devise_for :users
  root to: "planets#index"

  resources :planets do
    resources :reservations, only: :create
  end
  resources :reservations, only: :destroy
end
