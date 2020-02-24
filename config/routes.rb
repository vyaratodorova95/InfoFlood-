Rails.application.routes.draw do
  get 'about/index'
  resources :information
  resources :location
  resources :country
  get 'info_flood/index'
  root 'info_flood#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
