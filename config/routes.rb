Rails.application.routes.draw do
  devise_for :users
  root 'products#index'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  get 'picks', to: 'pages#picks'

  get 'pages/FAQ'



  resources :categories
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




end
