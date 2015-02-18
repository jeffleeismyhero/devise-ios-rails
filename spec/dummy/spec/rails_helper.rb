# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV.fetch("RAILS_ENV") { 'test' }
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.backtrace_formatter.exclusion_patterns.push(/gems/)

  Capybara.javascript_driver = :webkit
end
