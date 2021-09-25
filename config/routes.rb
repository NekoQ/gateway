Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: { registrations: 'registrations' }

  namespace :api do
    resources :connections,  only: [:index]
    resources :customers,    only: [:create]
    resources :accounts,     only: [:index]
    resources :transactions, only: [:index]
    get '/transactions/pending', to: 'pending_transactions#index'
  end

  namespace :connection do
    resources :create,    only: [:index]
    resources :refresh,   only: [:index]
    resources :reconnect, only: [:index]
    resources :destroy,   only: [:index]
  end

  resources :accounts, only: [:index]
  resources :transactions, only: [:index]

  get '*path', to: 'home#index', via: :all
end
