Rails.application.routes.draw do
  devise_for :admin,skip: [:passwords,:registrations], controller: {
    sessions: "admin/sessions"
  }
  devise_for :users,skip: [:passwords],controller: {
    registrations: "user/registrations",
    sessions: "user/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
