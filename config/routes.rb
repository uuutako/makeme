Rails.application.routes.draw do
devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root'plans#index'  

 
  resources :users, only: :new  
end
