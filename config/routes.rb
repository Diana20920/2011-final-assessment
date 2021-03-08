Rails.application.routes.draw do
  resources :doctors, only: [:index]
  resources :surgeries, only: [:show, :update]
end
