Rails.application.routes.draw do
  root to: "items#index"
  resources :items, only: [:new, :create, :show, :edit]
  devise_for :users
end
