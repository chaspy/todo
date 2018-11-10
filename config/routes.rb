Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks
  resources :tags
  devise_for :users, controllers: {
      omniauth_callbacks: "users/omniauth_callbacks"
  }
  devise_scope :user do
    delete '/users/sign_out' => 'devise/sessions#destroy'
  end
end
