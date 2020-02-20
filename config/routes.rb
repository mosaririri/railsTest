# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  get 'static_pages/home'
  get 'top/index'
  get 'users/index'
  get 'tasks/new/:id', to: 'tasks#new', as: :tasks_new
  post 'tasks/new/:id', to: 'tasks#create', as: :tasks_create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 get '/signup', to: 'users#new'
 post '/signup', to: 'users#create'

 resources :users
 resources :tasks, only:[:show, :create, :update, :destroy]
end
