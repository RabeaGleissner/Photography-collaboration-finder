Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  root to: "home#index"
  get '/about', to: 'home#about'
  get '/gallery', to: 'home#gallery'
  get '/tips', to: 'home#tips'
  get  '/list', to: 'users#list'

  resources :users do
    member do
      get 'new_user'
      patch 'update_new_user'
      get 'get_photos'
    end
  end

  resources :collaborations

end
