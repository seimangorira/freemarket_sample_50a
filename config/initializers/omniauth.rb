Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['1061669557557216'], ENV['b8aeecd5ad074edb8c99ba2e9f89b96b']
end