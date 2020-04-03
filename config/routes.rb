Rails.application.routes.draw do

  # Mechanics
  get '/mechanics', to: 'mechanics#index'

  # Amusement Parks
  get '/parks/:id', to: 'parks#show'

end
