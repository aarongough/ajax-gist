require 'test_helper'
require 'performance_test_help'

# Profiling results for each test method are written to tmp/performance.
class BrowsingTest < ActionController::PerformanceTest

  def setup
    github_gist_stubs
  end

  def test_gist
    get '/gist/1010.js'
  end
end
