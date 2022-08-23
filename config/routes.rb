# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  get "toggleusers",to:"admins/users#searchuser"
  get "toggleprojects",to:"admins/projects#searchproject"

  namespace :guests do
    resources :guests
    resources :users
  end

  namespace :developers do
    resources :developers
    resources :users
  end

  namespace :technical_leads do
    resources :technical_leads
    resources :users
    resources :projects
    resources :developers
    resources :user_project
    resources :skills
    get "profile_details",to:"users#profile_details"
    get 'user_projects_details/:id', to: 'user_projects#details'
    delete 'delete_user_project/:id', to: 'user_projects#destroy'
    get "developer_id/:id",to:"user_projects#assignprojects"
    get "project_id/:id",to:"user_projects#assigndeveloper"
    get "project_users/:id",to:"projects#project_users"
    get "skill_users/:id",to:"skills#skills_users"
  end

  namespace :engineering_managers do
    resources :engineering_managers
    resources :users
    resources :projects
    resources :developers
    resources :user_projects
    resources :skills
    get "profile_details",to:"users#profile_details"
    get 'user_projects_details/:id', to: 'user_projects#details'
    delete 'delete_user_project/:id', to: 'user_projects#destroy'
    get "developer_id/:id",to:"user_projects#assignprojects"
    get "project_id/:id",to:"user_projects#assigndeveloper"
    get "project_users/:id",to:"projects#project_users"
    get "skill_users/:id",to:"skills#skills_users"

  end

  namespace :director_generals do
    resources :director_generals
    resources :users
    resources :projects
    resources :developers
    resources :user_projects
    resources :skills

    get "profile_details",to:"users#profile_details"
    get 'user_projects_details/:id', to: 'user_projects#details'
    delete 'delete_user_project/:id', to: 'user_projects#destroy'
    get "developer_id/:id",to:"user_projects#assignprojects"
    get "project_id/:id",to:"user_projects#assigndeveloper"
    get "project_users/:id",to:"projects#project_users"
    get "skill_users/:id",to:"skills#skills_users"

  end


  namespace :admins do
    resources :users
    resources :projects
    resources :developers
    resources :user_projects
    resources :user_skills

    get "profile_details",to:"users#profile_details"
    resources :educations
    resources :dependents
    resources :personal_informations
    resources :emergency_contacts
    resources :skills
    get 'user_projects_details/:id', to: 'user_projects#details'
    delete 'delete_user_project/:id', to: 'user_projects#destroy'
    get "developer_id/:id",to:"user_projects#assignprojects"
    get "project_id/:id",to:"user_projects#assigndeveloper"
    get "project_users/:id",to:"projects#project_users"
    get "skill_users/:id",to:"skills#skills_users"

  end
end
