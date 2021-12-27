Rails.application.routes.draw do
  root 'fac#input'
  post 'fac/output'
  get 'fac/input'
  get 'fac/output'
  get 'fac/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end