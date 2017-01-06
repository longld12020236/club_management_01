Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "registrations"}
  devise_for :admin, controllers: {sessions: "admin/sessions"}
  devise_scope :admin do
    get "/admin" => "admin/sessions#new", as: :new_admin_sessions
    delete "/admin/sign_out" => "admin/sessions#destroy", as: :destroy_admin
  end

  root "static_pages#index"
  resources :club_requests
  resources :users
  resources :admins
  namespace :admin do
    get "home" => "static_pages#index"
    resources :organizations
    resources :users
    resources :organizations, except: [:edit, :update]
  end
  namespace :manager do
    get "" => "static_pages#index"
    resources :club_requests
    resources :organizations, only: [:show, :edit, :update]
  end
  resources :organizations, only: :show
end
