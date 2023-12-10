Rails.application.routes.draw do
  devise_for :users

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Set default route to the home page
  root 'home#index'

  # products page route
  resources 'products', only: %i[index show]

  # categories page route
  resources 'categories', only: :show

  # brands page route
  resources 'brands', only: %i[index show]

  resources "search", only: :index
end
