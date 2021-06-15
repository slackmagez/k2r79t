Rails.application.routes.draw do
    get "/auth/oauth2/callback", to: "auth0#callback", as: :auth0_callback
    get "/auth/failure", to: "auth0#failure", as: :auth0_failure
    get "/auth/logout", to: "auth0#logout", as: :auth0_logout

    namespace :api do
        resources :users, only: [] do
            resources :bookings, except: [ :new, :edit ]
        end
    end

    root 'application#index'
end
