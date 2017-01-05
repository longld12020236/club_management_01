Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
  end

  namespace :admin do
    get 'users/show'
  end

  namespace :admin do
    get 'users/edit'
  end

  namespace :admin do
    get 'users/update'
  end

  devise_for :users, controllers: {registrations: "registrations"}
  devise_for :admin, controllers: {sessions: "admin/sessions"}
  devise_scope :admin do
    get "/admin" => "admin/sessions#new", as: :new_admin_sessions
    delete "/admin/sign_out" => "admin/sessions#destroy", as: :destroy_admin
  end

  root "static_pages#index"
  resources :club_requests
  resources :users
  namespace :admin do
    get "home" => "static_pages#index"
    resources :organizations
  end
  namespace :manager do
    root "static_pages#index"
  end
  resources :organizations, only: :show
end
