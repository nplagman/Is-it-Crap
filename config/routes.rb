Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :nickspicks
  devise_for :users
  root "pages#show", page: "home"

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  get 'picks', to: 'pages#picks'

  get 'pages/FAQ'

  get 'home', to: 'pages#home'

  resources :categories
  resources :products

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




end
