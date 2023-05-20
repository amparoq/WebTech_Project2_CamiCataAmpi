Rails.application.routes.draw do
  resources :users
  resources :tickets
  resources :tags_tickets
  resources :tags
  resources :supervisors
  resources :responses
  resources :requiring_users
  resources :executives
  resources :executive_metrics
  resources :comments
  resources :attachments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
