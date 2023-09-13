Rails.application.routes.draw do
  resources :settings
  devise_for :users
  root 'instagram#home_page'
  get 'instagram/landing_page'
  
  
  get 'users/profile' , as: :user_profile
  post 'users/update_profile' , as: :update_user_profile
  
  # post 'friends/friend_request' , as: :friend_request

  resources :friends do
    member do
      post :friend_request
      post :approve_request
      post :reject_request
    end

    collection do
      get :pending_requests
      get :user_friends
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
