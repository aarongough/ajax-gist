ActionController::Routing::Routes.draw do |map|
  map.root    :controller => :info, :action => :index
  map.connect "/gist/:id.:format", :controller => :gist, :action => :index
end
