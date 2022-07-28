Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  namespace :admins do
    resources :admins
    resources :projects
    resources :developers
  end

  namespace :developers do
    resources :developers
  end

end
