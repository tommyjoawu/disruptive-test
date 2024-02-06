Rails.application.routes.draw do
  resources :investments
  resources :coins
  resources :global_parameters
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'static_pages/home'

  #Root Page
  root to: 'static_pages#home'
end
