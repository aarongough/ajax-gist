require 'test_helper'

class GistControllerTest < ActionController::TestCase
  
  def setup
    github_gist_stubs
  end
  
  test "calling index without an id should return bad_request" do
    get :index
    assert_response :bad_request
  end
  
  test "calling index with id should return success" do
    get :index, :id => 1010
    assert_response :success
  end
  
  test "index should use template index" do
    get :index, :id => 1010
    assert_template :index
  end
  
  test "index response should include gist markup" do
    get :index, :id => 1010
    assert @response.body.include?('http://gist.github.com/stylesheets/gist/embed.css'), "Response body should include Gist stylesheet url"
    assert @response.body.include?('<div id=\"gist-'), "Response body should include Gist markup"
    assert !@response.body.include?('document.write('), "Response body should not include document.write"
  end
  
end
