Rails.application.routes.draw do
  
  resources :users, only: [:new, :create, :show, :edit, :update] do
    resources :lists, only: [:new, :create]
    resources :places, only: [:new, :create, :show, :edit, :update]
  end

end
