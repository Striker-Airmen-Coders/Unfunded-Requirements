Rails.application.routes.draw do
  resources :reqs
  devise_for :users
  get 'pages/type', to: "pages#type", as: "type"
  get 'pages/fma', to: "pages#fma", as: "fma"
  get 'pages/unit', to: "pages#unit", as: "unit"
  get 'pages/edit', to: "pages#edit", as: "edit"
  root to: 'reqs#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
