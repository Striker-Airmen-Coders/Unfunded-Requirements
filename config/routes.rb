Rails.application.routes.draw do
  get 'example_pages/one_dialog'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
