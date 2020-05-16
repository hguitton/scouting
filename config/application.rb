require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Scouting
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.autoload_paths += %W(#{config.root}/lib)
    config.assets.initialize_on_precompile = false
    config.generators do |g|
      g.jbuilder false
      g.helper false
    end
    config.filter_parameters << :password
    config.dsn = 'https://5eb4f0d9c79c4965b30ce8878241c4a0:f8d99d0e1a344012b1eadc0fc75d089a@o393401.ingest.sentry.io/5242434'
  end
end
