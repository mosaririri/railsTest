# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/home'
  get 'top/index'
  get 'users/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 get '/signup', to: 'users#new'
 post '/signup', to: 'users#create'

 resources :users
 resources :tasks, only:[:create, :destroy]
end
