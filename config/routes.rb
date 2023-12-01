Rails.application.routes.draw do
  get 'products/index'
  get 'products/show'
  # Set default route to the home page
  root 'home#index'

end
