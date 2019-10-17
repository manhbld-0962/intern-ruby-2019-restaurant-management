Rails.application.routes.draw do
  get 'discounts/new'
  get 'discounts/show'
  get 'discounts/create'
  get 'discounts/edit'
  get 'discounts/update'
  get 'discounts/destroy'
  root to: "static_pages#home"
  get "help", to: "static_pages#help"
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
