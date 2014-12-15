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

  s.add_dependency "rails", "~> 4.1.8"
  s.add_dependency "devise"
  s.add_dependency "simple_token_authentication"
  s.add_dependency "active_model_serializers"
end
