class SearchController < ApplicationController
  def index
    conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1.json?api_key=#{ENV['API_KEY']}&format=JSON")

    binding.pry
    raw_search = conn.get '/nearest'

    response = JSON.parse(raw_search)
  end
end
