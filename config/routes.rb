Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'informations', to: 'pages#informations'
  get 'help', to: 'pages#help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :children do
    resources :reminders
  end
  resources :organizations
end
