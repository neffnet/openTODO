Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do

    resources :users

    resources :lists do
      resources :items, only: [:create, :destroy]
    end

  end

  get 'welcome/index'

  root to: 'welcome#index'
end
