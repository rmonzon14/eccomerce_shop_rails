Rails.application.routes.draw do
  # Devise route
  devise_for :users

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Set default route to the home page
  root 'home#index'

  # products page route
  resources 'products', only: %i[index show]

  # cart page route
  resources "cart", only: %i[show create index destroy]

  # categories page route
  resources 'categories', only: :show

  # brands page route
  resources 'brands', only: %i[index show]

  # Search page route
  resources "search", only: :index

  # user_infos route
  get "user_infos/new", to: "user_infos#new", as: "new_user_info"
  get "user_infos/:id", to: "user_infos#show", as: "user_info"
  get "user_infos/:id/edit", to: "user_infos#edit", as: "edit_user_info"
  post 'user_infos', to: 'user_infos#create'
  patch 'user_infos/:id', to: 'user_infos#update'

end
