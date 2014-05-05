GreenSky1::Application.routes.draw do

  #get "admins/index"

  #get "admins/create"

  get "admins/show"

  get "admins/edit"

  get "admins/new"

  get "admins/update"

  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"
  get "sign_up_admin" => "admins#new", :as => "sign_up_admin"

  #get "users/index"

  #get "users/create"

  #get "users/show"

  #get "users/new"

  get "users/edit"
  root :to => "users#new"

  resources :users
  resources :sessions
  resources :admins


end
