Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks

  devise_for :users, controllers: {
      omniauth_callbacks: "users/omniauth_callbacks"
  }
end
