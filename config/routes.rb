Rails.application.routes.draw do
    get "/auth/oauth2/callback" => "auth0#callback"
    get "/auth/failure" => "auth0#failure"

    namespace :api do
        resources :users do
            resources :bookings
        end
    end

    root 'application#index'
end
