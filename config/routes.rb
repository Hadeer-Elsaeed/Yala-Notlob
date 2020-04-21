Rails.application.routes.draw do
  resources :friendships
  resources :orders
  resources :groups
  devise_for :users
  as :user do
  	# Customize root for user 
  	get "signin" => 'devise/sessions#new'
  	delete "signout" => 'devise/sessions#destroy'
    get 'signup' => 'devise/registrations#new'
   
  end
  root 'groups#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
