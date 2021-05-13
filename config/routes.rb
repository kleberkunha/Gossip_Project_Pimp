Rails.application.routes.draw do
  get "/index", to: "static#index"
  get "/welcome/:user", to: "static#welcome"
  get "/team", to: "static#team"
  get "/contact", to: "static#contact"
  get "/gossip/:id", to: "static#gossip"
  get "/author", to: "static#author"


  resources :gossips do
    resources :comments
  end #take care about all the files liked to gossip
  resources :users
  resources :cities
  resources :comments
  resources :sessions
  #will create roots with all the files gossips

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
