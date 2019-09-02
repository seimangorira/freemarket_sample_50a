Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['1061669557557216'], ENV['b8aeecd5ad074edb8c99ba2e9f89b96b'], scope: "client"
    provider :google_oauth2, ENV['291828259150-a2duj48dejb0miuvq2huqa5imap2bg0u.apps.googleusercontent.com'], ENV['HNb7FlR_tNjG3rsDSHOxS912'], scope: "client"
end