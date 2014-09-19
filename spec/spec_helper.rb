$LOAD_PATH.unshift(File.expand_path("../../lib", __FILE__))
require File.expand_path("../support/env", __FILE__)

require "database_cleaner"
require "simplecov"
SimpleCov.start

require "store_schema"
require File.expand_path("../support/models", __FILE__)

RSpec.configure do |config|
  config.mock_framework = :mocha

  config.before do
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end
