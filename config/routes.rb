Rails.application.routes.draw do
  # TODO enable Rails Engine when ready in glimmer-dsl-web
#   mount Glimmer::Engine => "/glimmer" # add on top
  resources :welcomes
  resources :samples
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'welcomes#index'
end
