Rails.application.routes.draw do

  # Mechanics
  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'
  patch '/mechanics/:id', to: 'mechanics#update'

  # Amusement Parks
  get '/parks/:id', to: 'parks#show'

end
