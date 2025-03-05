require_relative 'boot'

require 'rails/all'
require 'dotenv/load'
require_relative "../app/middleware/request_logger_middleware"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.middleware.use Rack::Attack
    config.middleware.use RequestLoggerMiddleware
    config.active_job.queue_adapter = :sidekiq
    config.autoload_paths += Dir[Rails.root.join('app/contracts')]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
