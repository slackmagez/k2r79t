Rails.application.config.middleware.use OmniAuth::Builder do
    provider(
        :auth0,
        <%= ENV["AUTH0_ID"] %>,
        <%= ENV["AUTH0_SECRET"] %>,
        <%= ENV["AUTH0_DOMAIN"] %>,
        callback_path: "/auth/oauth2/callback"
    )
end
