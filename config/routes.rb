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

    get 'address', controller: :address, action: :index, as: :address
    post 'address', controller: :address, action: :update, as: :update_address

    get 'banking_account', controller: :banking_account, action: :index, as: :banking_account
    post 'banking_account', controller: :banking_account, action: :update, as: :update_banking_account

    get 'documents', controller: :documents, action: :index, as: :documents
    post 'documents', controller: :documents, action: :update, as: :update_documents

    resources :purchases
    resources :transactions, only: [:index, :show]
    resources :sponsored, only: [:index]
    resources :withdraws, only: [:index, :show, :create, :cancel] do
      post 'cancel', on: :member
    end
  end

  # Defines the root path route ("/")
  root "index#index"
end
