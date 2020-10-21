require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Naijapro
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    #config.filestack_rails.api_key = Rails.application.credentials.dig(:filestack, :api_key)
    config.filestack_rails.api_key = :filestack, Rails.application.credentials[Rails.env.to_sym][:filestack][:api_key]
    config.filestack_rails.client_name = 'naijaproperty_custom_client'
    config.filestack_rails.version = '3.x.x'

    #config.filestack_rails.client_name = :filestack, Rails.application.credentials[Rails.env.to_sym][:filestack][:custom_client]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
  
end
