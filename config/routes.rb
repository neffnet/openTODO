Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :users
  end

  get 'welcome/index'

  root to: 'welcome#index'
end
