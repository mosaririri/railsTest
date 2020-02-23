# frozen_string_literal: true

Rails.application.routes.draw do
  # deviseのリダイレクト先を設定するために設定
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  root 'top#index'
  get 'static_pages/home'
  get 'top/index'
  get 'users/index'
  get 'tasks/new/:id', to: 'tasks#new', as: :tasks_new
  post 'tasks/new/:id', to: 'tasks#create', as: :tasks_create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get 'mypage/index', to: 'mypage#index'

 resources :users
 resources :tasks, only:[:show, :create, :update, :destroy]
end
