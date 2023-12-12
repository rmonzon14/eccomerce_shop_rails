Rails.application.routes.draw do

  # Devise route
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

  # Search page route
  resources "search", only: :index

  # user_infos route
  #get 'user_info/show'
  #get 'user_info/create'
  #get 'user_info/update'
  resources "user_info", only: %i[show create update]
end
