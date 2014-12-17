# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../spec/dummy/Gemfile', __FILE__)

if File.exist?(ENV['BUNDLE_GEMFILE'])
  require 'bundler/setup'
else
  raise "no file #{ENV['BUNDLE_GEMFILE']}"
end
