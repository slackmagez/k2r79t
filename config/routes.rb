Rails.application.routes.draw do
    namespace :api do
        resources :users do
            resources :bookings
        end
    end

    root 'application#index'
end
