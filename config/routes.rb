Rails.application.routes.draw do
  get 'pages/about'

  get 'pages/contact'

  get 'pages/FAQ'

  resources :categories
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root "products#index"


end
