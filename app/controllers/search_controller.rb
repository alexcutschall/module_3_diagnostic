class SearchController < ApplicationController
  def index
    zip_code = params["q"]
    conn = Faraday.new(url: "https://developer.nrel.gov")

    response = conn.get "/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['API_KEY']}&location=#{zip_code}&LIMIT=10&fuel_type=LPG, ELEC"

    stations = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    stations["fuel_stations"].each do |station|
      Station.new(station)
    end
  end
end
