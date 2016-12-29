Rails.application.routes.draw do

  root to: 'application#index'

  resources :users, only: [:new, :create, :edit, :update] do
    resources :lists, only: [:new, :create, :show]
    resources :places, only: [:new, :create, :show, :edit, :update]
  end

  get '/dashboard', to: 'users#show', as: 'users_show'

  resources :sessions, only: [:new, :create, :destroy]
end
