Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  root to: "home#index"
  get '/about', to: 'home#about'
  get '/gallery', to: 'users#gallery'
  get '/tips', to: 'users#tips'

  resources :users
  get '/new_user', to: 'users#new_user'
  
end
