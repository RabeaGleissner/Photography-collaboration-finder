Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  root to: "home#index"
  get '/about', to: 'home#about'
  get '/gallery', to: 'home#gallery'
  get '/tips', to: 'home#tips'

  resources :users do
    member do
      get 'new_user'
    end
  end

  resources :collaborations

end
