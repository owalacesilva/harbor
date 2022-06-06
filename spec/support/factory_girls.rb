# Add additional requires below this line. Rails is not loaded until this point!
require "factory_bot_rails"

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
