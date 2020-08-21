Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :lives do
    resources :bookings, only:[:create, :new]
  end

  resources :bookings, only:[:show, :index, :destroy]
  
  get "/lifeguards", to: 'pages#lifeguards' # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
