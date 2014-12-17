require 'capybara/rspec'

if ENV['CI']
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = 2
  config.order = :random
  Kernel.srand config.seed
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
