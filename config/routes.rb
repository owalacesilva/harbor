Rails.application.routes.draw do
  devise_for :users, path: "backoffice", controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords"
  }

  devise_for :accounts, path: "admin", controllers: {
    sessions: "accounts/sessions",
    registrations: "accounts/registrations",
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :admin do
    get "", controller: :overview, action: :index, as: :overview

    resources :users do
      post "delete", action: :destroy, on: :member
    end
  end

  namespace :backoffice do
    get '', controller: :overview, action: :index, as: :overview

    get 'profile', controller: :profile, action: :index, as: :profile
    post 'profile', controller: :profile, action: :update, as: :update_profile

    get 'account/password', controller: :password, action: :index, as: :account_password
    post 'account/password', controller: :password, action: :update, as: :update_account_password
  end

  # Defines the root path route ("/")
  root "index#index"
end
