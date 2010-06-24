def github_gist_stubs
  unless(TEST_LIVE_API)
    
    File.open(File.join(File.dirname(__FILE__), '..', 'fixtures', 'github_gist_js_response.txt')) do |file|
      stub_request(:get, Regexp.new("http://gist.github.com/.*")).to_return(file)
    end
    
    File.open(File.join(File.dirname(__FILE__), '..', 'fixtures', 'github_deleted_gist.txt')) do |file|
      stub_request(:get, Regexp.new("http://gist.github.com/2.js")).to_return(file)
    end

    File.open(File.join(File.dirname(__FILE__), '..', 'fixtures', 'github_gist_id_not_assigned.txt')) do |file|
      stub_request(:get, Regexp.new("http://gist.github.com/99999999.js")).to_return(file)
    end
    
  end
end