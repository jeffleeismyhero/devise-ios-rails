require 'factory_girl'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
FactoryGirl.definition_file_paths << 'spec/dummy/spec/factories'
FactoryGirl.find_definitions
