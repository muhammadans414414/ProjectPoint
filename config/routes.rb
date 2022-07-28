Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  namespace :admins do
    resources :admins
    resources :projects
    resources :developers
    resources :user_projects

    get "user_projects_details/:id",to:"user_projects#details"
    delete "delete_user_project/:id",to:"user_projects#destroy"

  end

  namespace :developers do
    resources :developers
  end

end
