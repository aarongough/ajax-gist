require 'test_helper'

class AjaxGistTest < ActiveSupport::TestCase
  
  test "AjaxGist.base_url should return base gist URL" do
    assert_equal "http://gist.github.com", AjaxGist.base_url
  end
  
  test "AjaxGist.gist_embed_url_for_id should raise error if not supplied with an id" do
    assert_raises ArgumentError do
      AjaxGist.gist_embed_url_for_id
    end  
  end
  
  test "AjaxGist.gist_embed_url_for_id should return gist embed url" do
    assert_equal "http://gist.github.com/101010.js", AjaxGist.gist_embed_url_for_id(1010)
  end
  
  test "AjaxGist.fetch_gist_embed_code should raise error if not supplied with a URL" do
    assert_raises ArgumentError do
     AjaxGist.fetch_gist_embed_code
    end
  end
  
  test "AjaxGist.fetch_gist_embed_code should return Gist embed code" do
    gist = AjaxGist.fetch_gist_embed_code(1010)
    assert gist.include?("document.write"), "Gist embed code did not include 'document.write'"
  end
  
  test "AjaxGist.ajax_gist_embed_code should raise error if not supplied with id" do
    assert_raises ArgumentError do
      AjaxGist.ajax_gist_embed_code
    end
  end
  
  test "AjaxGist.ajax_gist_embed_code should return treated gist embed code" do
    gist = AjaxGist.ajax_gist_embed_code(1010)
    assert gist.include?("document.createElement"), "Treated Gist embed code did not include 'document.createElement'"
  end
  
end
