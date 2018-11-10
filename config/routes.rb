Rails.application.routes.draw do
  root to: 'task#index'
  get 'task/show'
  get 'task/index'
  get 'task/update'
  get 'task/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
