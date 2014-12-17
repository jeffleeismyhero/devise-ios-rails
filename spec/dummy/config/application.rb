require File.expand_path('../boot', __FILE__)
require 'rails/all'

Bundler.require(*Rails.groups)

module DeviseIosRailsExample
  class Application < Rails::Application

    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths << Rails.root.join('lib')
    config.autoload_paths << Rails.root.join(config.root, 'app', 'services')
  end
end
