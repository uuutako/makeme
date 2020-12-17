Rails.application.routes.draw do
  devise_for :users

  root'plans#index'  
  
  resources :plans, only:[:new, :create]
 
  resources :users, only: :new  
end
