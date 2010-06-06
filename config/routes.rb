ActionController::Routing::Routes.draw do |map|
  map.connect "/gist/:id.:format", :controller => :gist, :action => :index
end
