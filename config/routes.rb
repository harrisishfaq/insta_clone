Rails.application.routes.draw do
  resources :settings
  devise_for :users
  root 'instagram#home_page'
  get 'instagram/landing_page'


  get 'users/profile' , as: :user_profile
  post 'users/update_profile' , as: :update_user_profile

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
