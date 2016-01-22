Rails.application.routes.draw do
  mount Payola::Engine => '/payola', as: :payola
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#home'

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:show]

  resources :subscriptions, only: [:new, :create]
end
