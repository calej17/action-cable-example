Rails.application.routes.draw do
  root 'chatrooms#index'

  get 'signin', to: 'sessions#new', as: 'signin'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy', as: 'signout'

  mount ActionCable.server => '/cable'

  resources :chatrooms, params: :slug
  resources :messages
  resources :users
end
