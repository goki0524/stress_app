require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "8503d7101192913fba194c3eab6f763bf778f0a154dc5841fe1f4a2494210715"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
ActiveSupport.on_load(:active_record) do
  extend Dragonfly::Model
  extend Dragonfly::Model::Validations
end
