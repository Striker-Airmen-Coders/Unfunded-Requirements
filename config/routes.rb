Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :reqs do
      post 'import', on: :collection
  end
  
  get '/tagged', to: "reqs#tagged", as: :tagged

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  get 'pages/info', to: "pages#info", as: "info"
  root to: 'pages#info'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
