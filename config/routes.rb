Rails.application.routes.draw do
  root to: 'pictures#index'
  resources :pictures, only: [:index, :new, :create]
end
