Rails.application.routes.draw do
    get "/auth/oauth2/callback", to: "auth0#callback", as: :auth0_callback
    get "/auth/failure", to: "auth0#failure", as: :auth0_failure

    namespace :api do
        resources :users do
            resources :bookings
        end
    end

    root 'application#index'
end
