require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'

Bundler.require(*Rails.groups)

module Tundra
  class Application < Rails::Application
    config.api_only = true

    config.generators do |g|
      g.request_specs false
      g.routing_specs false
      g.test_framework :rspec
    end
  end
end
