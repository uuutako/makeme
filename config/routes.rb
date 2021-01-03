Rails.application.routes.draw do
  devise_for :users

  root'plans#index'  
  get 'plans/search'
  get 'bookmarks/index'

  resources :plans do
    resource :bookmarks, only: [:index, :show,:create, :destroy]
  end
  
  resources :users, only: [:index, :new, :show, :edit, :update] 
end
