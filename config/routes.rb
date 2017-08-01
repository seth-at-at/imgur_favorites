Rails.application.routes.draw do
  root 'home#index'
  get '/auth/imgur/callback',   to: 'sessions#show'
  get 'login',  to: 'sessions#new', as: :imgur_auth
  post '/catchtoken', to: 'sessions#create'
  get '/dashboard', to: 'user#index'
  resources :folders, only: [:new, :create, :show]
  resources :favorites, only: [:index]
end
