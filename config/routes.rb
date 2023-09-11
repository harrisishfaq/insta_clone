Rails.application.routes.draw do
  devise_for :users
  root 'instagram#home_page'
  get 'instagram/landing_page'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
