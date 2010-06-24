ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

TEST_LIVE_API = false

unless( TEST_LIVE_API )
  require 'webmock/test_unit'
  include WebMock
end

require_files = []
require_files.concat Dir[File.join(File.dirname(__FILE__), 'stubs', '*.rb')]

require_files.each do |file|
  require File.expand_path(file)
end

class ActiveSupport::TestCase
end
