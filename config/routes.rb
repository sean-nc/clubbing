Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users
  resources :users do
    resources :profiles, only: [:new, :create, :edit, :update]
  end
  resources :venues do
    member do
      get 'employees'
      get 'add_employee'
    end
  end
end
