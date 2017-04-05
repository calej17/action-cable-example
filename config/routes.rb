Rails.application.routes.draw do
  root 'chatrooms#index'

  get 'signin', to: 'sessions#new', as: 'signin'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy', as: 'signout'

  resources :chatrooms
  resources :messages
  resources :users
end
