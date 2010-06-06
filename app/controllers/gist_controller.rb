class GistController < ApplicationController

  # GET /gist/:id
  def index
    if(params[:id])
      @gist_markup = AjaxGist.gist_markup_for(params[:id].to_i)
      @id = params[:id].to_i
      
      respond_to do |format|
        format.js
      end
    else
      head :status => :bad_request
    end
  end

end
