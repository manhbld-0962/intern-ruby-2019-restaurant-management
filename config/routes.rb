Rails.application.routes.draw do
  root to: "static_pages#home"
  get "help", to: "static_pages#help"
  get "show_booking", to: "bookings#index"
  resources :discounts
  resources :tables do
    resources :bookings, shallow: true
  end
  resources :foods
  resources :menus
  resources :catalogs do
    resources :posts, shallow: true
  end
  devise_for :users, controllers: {
    sessions: "users/sessions",
  	registrations: "users/registrations"
  }
  devise_scope :user do
  	get "sign_up", to: "users/registrations#new"
  	post "sign_up", to: "users/registrations#create"
    get "login", to: "users/sessions#new"
    post "login", to: "users/sessions#create"
	end
end
