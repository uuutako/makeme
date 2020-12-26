Rails.application.routes.draw do
  devise_for :users

  root'plans#index'  
  get 'plans/search'

  resources :plans do
    resource :bookmarks, only: [:create, :destroy]
    collection do
      get :bookmarks
    end
  end



  resources :users, only: [:new, :show, :edit, :update] 
end
