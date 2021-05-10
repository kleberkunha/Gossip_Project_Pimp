Rails.application.routes.draw do
  get "/index", to: "static#index"
  get "/welcome/:user", to: "static#welcome"
  get "/team", to: "static#team"
  get "/contact", to: "static#contact"
  get "/gossip/:id", to: "static#gossip"
  get "/author/:id_user", to: "static#author"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
