Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :lives do
    resources :bookings, only:[:create, :new]
  end

  resources :users do
    resources :bookings, only:[:index,:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
