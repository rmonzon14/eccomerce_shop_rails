Rails.application.routes.draw do
  # Set default route to the home page
  root 'home#index'

  resources 'artists', only: %i[index show]
end
