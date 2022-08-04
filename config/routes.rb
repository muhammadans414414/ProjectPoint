# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  get "toggleusers",to:"admins/users#searchuser"
  get "toggleprojects",to:"admins/projects#searchproject"
  namespace :admins do
    resources :users
    resources :projects
    resources :developers
    resources :user_projects
    get 'user_projects_details/:id', to: 'user_projects#details'
    delete 'delete_user_project/:id', to: 'user_projects#destroy'
    get "developer_id/:id",to:"user_projects#assignprojects"
    get "project_id/:id",to:"user_projects#assigndeveloper"
    get "project_users/:id",to:"projects#project_users"
  end

  namespace :developers do
    resources :developers
  end
end
