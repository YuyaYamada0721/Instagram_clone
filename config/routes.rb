Rails.application.routes.draw do
  resources :blogs
  resources :users, only: [:new]
end
