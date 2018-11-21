Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users
  resources :users do
    resources :profiles, only: [:new, :create, :edit, :update]
  end
end
