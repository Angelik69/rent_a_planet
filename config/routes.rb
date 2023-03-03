Rails.application.routes.draw do
  devise_for :users
  # get "landing", to: "planets#index"
  resources :planets do
    collection do
      get :user
    end
    resources :reservations, only: :create
  end
  resources :reservations, only: :destroy
  root to: "planets#landing"
end
