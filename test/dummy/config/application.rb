require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Dummy
  class Application < Rails::Application
    config.assets.precompile += [
      'graphql/voyager/rails/application.css',
      'graphql/voyager/rails/application.js',
      'graphql/voyager/rails/voyager.js'
    ]
  end
end
