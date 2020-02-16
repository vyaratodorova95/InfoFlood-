Rails.application.routes.draw do
  resources :information
  resources :location
  resources :country
  get 'info_flood/index'
  root 'info_flood#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
