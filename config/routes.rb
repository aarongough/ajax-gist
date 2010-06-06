ActionController::Routing::Routes.draw do |map|
  map.connect "/gist/:id", :controller => :gist, :action => :index
end
