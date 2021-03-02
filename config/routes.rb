Rails.application.routes.draw do
  get 'pages/login', to: "pages#login", as: "login"
  get 'pages/fma', to: "pages#fma", as: "fma"
  get 'pages/unit', to: "pages#unit", as: "unit"
  get 'pages/edit', to: "pages#edit", as: "edit"
  root to: 'pages#login'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
