# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    allowed_origins = {
      "development" => [ "http://localhost:5174" ],
      "staging"     => [ "https://staging.forumla-one.com" ],
      "production"  => [ "https://www.forumla-one.com" ]
    }

    origins allowed_origins[Rails.env] || []

    resource "*",
             headers: :any,
             methods: [ :get, :post, :put, :patch, :delete, :options, :head ]
  end
end
