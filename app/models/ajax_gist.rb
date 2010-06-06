require 'net/http'
require 'uri'

class AjaxGist

  def self.base_url
    "http://gist.github.com/"
  end
  
  def self.gist_embed_url_for_id(id)
    self.base_url + id.to_s + ".js"
  end
  
  def self.gist_embed_code(id)
    github_response = Net::HTTP.get_response(URI.parse(self.gist_embed_url_for_id(id)))
    if(github_response.code == "200")
      return github_response.body
    else
      "This Gist is no longer available, please check your URL"
    end
  end
  
  def self.gist_markup_for(id)
    embed_code = self.gist_embed_code(id)
    embed_code.gsub!("document.write('<link rel=\"stylesheet\" href=\"http://gist.github.com/stylesheets/gist/embed.css\"/>')", '')
    embed_code.strip!
    embed_code.gsub!("document.write('", '')
    embed_code.gsub!(/'\)\s*$/, '')
  end

end
