class SearchController < ApplicationController
  def index
    conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1.json?api_key=0TWVyL6HFkXC44dCq7wHlpElOLWkpyzJnkHiekhS&format=JSON")

    raw_search = conn.get '/nearest'

    response = JSON.parse(raw_search)
    binding.pry
  end
end
