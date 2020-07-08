Rails.application.routes.draw do
  resources :profiles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "pages#home"
  resources :listings
  # REST api structure for us
  # routes for listing
  # custom routes here
  # any path that is not defined in the app
  get "*path", to:"pages#not_found"
end
