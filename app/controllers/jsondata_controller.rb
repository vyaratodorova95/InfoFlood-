class JsondataController < ApplicationController
  def index
    @search = Search.all
    render json: JSON.pretty_generate(@search.as_json)
  end
end
