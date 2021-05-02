Rails.application.routes.draw do
  devise_for :users
  root to: 'pictures#index'
  # get "pictures/papafamily"

  resources :pictures do
    resources :comments, only: :create
    collection do
      get 'search'
    end
    collection do
      get 'papafamily'
    end
    collection do
      get 'papashow'
    end
    collection do
      get 'mamafamily'
    end
    collection do
      get 'mamashow'
    end
  end
  resources :users, only: :show
end
