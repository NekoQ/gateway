Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: { registrations: 'registrations' }

  namespace :connection do
    resources :create,    only: [:create]
    resources :refresh,   only: [:update]
    resources :reconnect, only: [:update]
    resources :destroy,   only: [:destroy]
  end

  resources :accounts, only: [:index]
  resources :transactions, only: [:index]

  get '*path', to: 'home#index', via: :all
end
