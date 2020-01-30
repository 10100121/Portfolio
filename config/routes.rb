Rails.application.routes.draw do

get 'comments/edit'
root to: 'public/users#index'

namespace :public do
  resources :users, :only => [:edit, :show, :update, :destroy, :index]
  get 'users/out'
  get 'users/search'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :rooms, :only => [:create, :show, :index]
  resources :posts, :only => [:edit, :show, :update, :destroy, :new, :create, :index] do
  resources :comments, :only => [:edit, :destroy, :create, :update]
  resources :nices, :only => [:create, :destroy]
  end
  resources :follows, :only => [:index]
  resources :dms, :only => [:index, :create, :new, :destroy]
end

namespace :admin do
  resources :users, :only => [:index, :destroy, :update, :edit, :new]
end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
