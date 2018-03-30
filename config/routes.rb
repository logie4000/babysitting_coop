Rails.application.routes.draw do
  resources :transactions
  resources :credits, only: [:index, :show, :create, :edit, :update] do
    member do
      get :mint
    end
  end

  resources :accounts
  resources :users

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :credits, only: [:index, :show, :create, :update] do
        member do
          get :mint
        end
      end
  
      resources :transactions, only: [:index, :show, :create, :update]
      resources :accounts, only: [:index, :show, :create, :update]
      resources :users, only: [:index, :show, :create, :update]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
