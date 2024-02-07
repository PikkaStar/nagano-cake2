Rails.application.routes.draw do

  devise_for :admin,skip: [:passwords,:registrations], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :users,skip: [:passwords],controllers: {
    registrations: "user/registrations",
    sessions: "user/sessions"
  }

  namespace :admin do
    root to: "homes#top"
    resources :users,only: [:index,:edit,:show,:update]
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
    resources :items, except: [:destroy]
    resources :orders, only: [:show,:update]
    resources :order_details, only: [:show,:update]
  end

 scope module: :user do
  root to: 'homes#top'
  resources :users, only: [:show,:edit,:update]
  resources :cart_items, only: [:index,:create,:update,:destroy] do
    collection do
      delete :destroy_all
    end
  end
  resources :items, only: [:index,:show]
  resources :orders,only: [:new,:create,:index,:show]
  resources :addresses, only: [:index,:create,:edit,:update,:destroy]
 end
end
