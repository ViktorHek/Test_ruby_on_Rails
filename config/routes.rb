Rails.application.routes.draw do

  devise_for :admins
  root controller: :articles, action: :index

  resources :articles, only: [:show, :new, :create, :edit, :update]
  
end
