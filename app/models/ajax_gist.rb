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
    begin
      github_response = Net::HTTP.get_response(URI.parse(self.gist_embed_url_for_id(id)))
    rescue SocketError, Errno::ENETDOWN
      return notice("There was a network error while trying to contact the GitHub Gist service.")
    end
    case github_response
      when Net::HTTPSuccess then github_response.body
      when Net::HTTPNotModified then github_response.body
    else
      notice("This Gist is no longer available, please check your URL")
    end
  end
  
  def self.gist_markup_for(id)
    embed_code = self.gist_embed_code(id)
    embed_code = embed_code.gsub("document.write('<link rel=\"stylesheet\" href=\"http://gist.github.com/stylesheets/gist/embed.css\"/>')", '')
    embed_code = embed_code.strip
    embed_code = embed_code.gsub("document.write('", '')
    embed_code = embed_code.gsub(/'\)\s*$/, '')
    if(embed_code == "deleted.")
      return notice("This Gist has been deleted but it's owner or by GitHub.")
    end
    embed_code
  end
  
  def self.notice(notice)
    "<span style=\\\"color: red; font-weight: bold;\\\">#{notice}</span>"
  end

end
