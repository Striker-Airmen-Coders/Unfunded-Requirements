Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :reqs
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  get 'pages/type', to: "pages#type", as: "type"
  get 'pages/fma', to: "pages#fma", as: "fma"
  get 'pages/unit', to: "pages#unit", as: "unit"
  get 'pages/info', to: "pages#info", as: "info"
  get 'pages/shipyard', to: "pages#shipyard", as: "shipyard"
  root to: 'pages#info'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
