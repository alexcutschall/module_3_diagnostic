class SearchController < ApplicationController
  def index
    zip_code = params["q"]
    conn = Faraday.new(url: "https://developer.nrel.gov")

    response = conn.get "/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['API_KEY']}&location=#{zip_code}&limit=10"

    stations = JSON.parse(response.body)
    stations.each do |station|
      Station.new(station)
    end
    binding.pry
  end
end
