Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions'} 
  root "pages#home"

  resources :users, only: [:index, :show, :create, :destroy, :update, :new, :edit] do
    resources :tickets, only: [:index, :show, :create, :destroy, :update, :new, :edit]
  end
  resources :tickets, only: [:index, :show, :create, :destroy, :update, :new, :edit] do
    resources :comments, only: [:index, :show, :create, :destroy, :update, :new, :edit]
    resources :attachments, only: [:index, :show, :create, :destroy, :update, :new, :edit]
  end  
  resources :responses, only: [:index, :show, :create, :destroy, :update, :new, :edit]
  resources :tags, only: [:index, :show, :create, :destroy, :update, :new, :edit]
  resources :executive_metrics, only: [:index, :show, :create, :destroy, :update, :new, :edit]
  # Defines the root path route ("/")
  # root "articles#index"
end
