# Routes for APIs

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :characters, only: %i[index create show update destroy] do
        resources :weapons, only: %i[index]
      end

      resources :fightings, only: %i[index create]

      # Matches any undefined route to base#undefined_route to handle unknown routes
      get '*a', to: 'base#undefined_route'
    end
  end
end