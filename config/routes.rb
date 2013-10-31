RailsDeviseTokenServer::Application.routes.draw do
  devise_for :users, controllers: { sessions: "sessions", registrations: "registrations" }

  root to: 'home#index'

  namespace "api/v1", :as=>:api, defaults: {format: 'json'} do

  end

  namespace :api, defaults: {format: 'json'} do

    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :tasks
    end
  end
end
