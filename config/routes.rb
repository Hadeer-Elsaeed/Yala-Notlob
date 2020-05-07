Rails.application.routes.draw do
  get 'home/index'
  # get 'status'
  get 'orders/status'
  get '/modal/:id', to: 'modal#show'
  get '/user/:id', to: 'users#show'

  resources :friendships

  resources :orders do
    resources :order_details 
    member do
      post 'invited' 
      post 'joined'
    end
  end
  
  resources :groups do
    member do
       delete 'remove/:friend_id', :action => 'remove_friend',:as => 'remove'
       post 'add_friend', :action => 'add_friend'
      end
  end
  # get 'new', to: 'orders#new'
  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth'
  }
  as :user do
  	# Customize root for user 
  	get "signin" => 'devise/sessions#new'
  	delete "signout" => 'devise/sessions#destroy'
    get 'signup' => 'devise/registrations#new'
    get 'edit' => 'devise/registrations#edit'
   
  end
  root 'home#index'
  post 'password/forgot', to: 'password#forgot'
  post 'password/reset', to: 'password#reset'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
