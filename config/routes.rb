Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users

  get 'example_pages/one_dialog'

  namespace :api do
    namespace :v1 do
      devise_for :users, only: :sessions, defaults: { format: :json }

      resources :example_things, only: [:create, :index, :destroy]
    end
  end

end
