# -*- encoding : utf-8 -*-
require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LingyunServerV2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # config.middleware.use Rack::Cors do
    #   allow do
    #     origins '*'
    #     resource '*',
    #       :headers => :any,
    #       :expose  => ['Access-Token', 'Expiry', 'Token-Type', 'Uid', 'Client'],
    #       :methods => [:get, :post, :options, :delete, :put]
    #   end
    # end

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :delete, :put, :patch, :options],
                      :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client']
      end
    end

    #config.time_zone = 'Beijing'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
