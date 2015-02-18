$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "devise-ios-rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "devise-ios-rails"
  s.version     = DeviseIosRails::VERSION
  s.authors     = ["Netguru"]
  s.email       = ["netguru@netguru.co"]
  s.homepage    = "http://github.com/netguru/devise-ios-rails"
  s.summary     = "Integrates devise authentication with iOS"
  s.description = "Integrates devise authentication with iOS"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_development_dependency "rake"
  s.add_development_dependency "bundler"
  s.add_dependency "rails", ">= 4.0.0", "< 4.2.0"
  s.add_dependency "devise", "~> 3.4"
  s.add_dependency "simple_token_authentication", "~> 1.7"
  s.add_dependency "active_model_serializers", "~> 0.9"
end
