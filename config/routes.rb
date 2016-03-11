Rails.application.routes.draw do

    resources :tools

    resources :users

    namespace :admin do
      resources :categories
    end

    root to: "tools#index"

    get '/login', to: "sessions#new"

    post '/login', to: "sessions#create"

    delete '/logout', to: "sessions#destroy"

    # get '/tools', to: "tools#index"

end
