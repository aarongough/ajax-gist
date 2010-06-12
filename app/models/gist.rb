require 'em-synchrony/em-http'

class Gist

  def self.base_url
    "http://gist.github.com/"
  end
  
  def self.gist_embed_url_for_id(id)
    self.base_url + id.to_s + ".js"
  end
  
  def self.gist_embed_code(id)
    if(EventMachine.reactor_running?)
      github_response = EventMachine::HttpRequest.new(self.gist_embed_url_for_id(id)).get
    else
      EventMachine.synchrony do
        github_response = EventMachine::HttpRequest.new(self.gist_embed_url_for_id(id)).get
        EventMachine.stop
      end
    end
    if(github_response.response)
      github_response.response
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
      return notice("Gist ID: #{id.to_i} has been deleted by it's owner or by GitHub.")
    end
    embed_code
  end
  
  def self.notice(notice)
    "<div style=\\\"border: 1px solid silver; padding: 6px; background: white;\\\"><span style=\\\"color: red; font-weight: bold;\\\">#{notice}</span></div>"
  end

end
