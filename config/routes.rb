Rails.application.routes.draw do
  devise_for :users
  root to: "planets#index"
  resources :planets do
    collection do
      get :user
    end
    member do
      get :calendar
    end
    resources :reservations, only: :create
  end

  resources :reservations, only: :destroy
end
