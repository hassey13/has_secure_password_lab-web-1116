Rails.application.routes.draw do

  root 'users#new'
  resources :users

  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy', as: 'logout'

end
