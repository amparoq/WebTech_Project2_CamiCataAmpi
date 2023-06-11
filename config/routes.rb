Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root 'pages#home'
  # routes.rb
  get '/tickets/search', to: 'tickets#search'


  resources :users, only: [:index, :show, :create, :destroy, :update, :new, :edit] do
    resources :tickets, only: [:index, :show, :create, :destroy, :update, :new, :edit]
  end
  resources :tickets do
    collection do
      get :index_others
    end
    resources :responses, only: [:new, :create, :edit, :update]
    resources :comments, only: [:new, :create]
    resources :attachments, only: [:index, :show, :create, :destroy, :update, :new, :edit]
  end

  resources :tags
  resources :executive_metrics
end
