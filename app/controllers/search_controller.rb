class SearchController < ApplicationController
  def index
    @search = StationSearch.new(params).stations
  end
end
