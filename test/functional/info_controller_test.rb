require 'test_helper'

class InfoControllerTest < ActionController::TestCase
  
  test "index should return success" do
    get :index
    assert_response :success
  end
  
  test "index should use index template" do
    get :index
    assert_template :index
  end
  
  test "overview should return success" do
    get :overview
    assert_response :success
  end
  
  test "overview should use index template" do
    get :overview
    assert_template :overview
  end
  
  test "static should return success" do
    get :static
    assert_response :success
  end
  
  test "static should use index template" do
    get :static
    assert_template :static
  end
  
  test "ajax should return success" do
    get :ajax
    assert_response :success
  end
  
  test "ajax should use index template" do
    get :ajax
    assert_template :ajax
  end
  
end
