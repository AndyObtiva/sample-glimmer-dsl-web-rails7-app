Rails.application.routes.draw do
  mount Glimmer::Engine => "/glimmer" # add on top
  resources :welcomes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'welcomes#index'
end
