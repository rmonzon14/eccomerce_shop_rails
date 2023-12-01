Rails.application.routes.draw do
  get 'brands/index'
  get 'brands/show'
  # Set default route to the home page
  root 'home#index'

  # products page route
  resources 'products', only: %i[index show]

  # categories page route
  resources 'categories', only: :show
end
