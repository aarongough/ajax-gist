class InfoController < ApplicationController

  layout "default"
  before_filter :cache

  def index
  end
  
  def overview
  end
  
  def ajax
  end
  
  def static
  end
  
  private
  
    def cache
      expires_in 1.hour, :public => true, 'max-stale' => 1.hour
    end

end
