Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :nickspicks
  devise_for :users
  root 'products#index'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  get 'picks', to: 'pages#picks'

  get 'pages/FAQ'

  get 'home', to: 'pages#home'

  resources :categories
  resources :products do
    member do
      delete :remove_attachment
      # get :make_image_featured
      # get :reset_featured
end
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




end
