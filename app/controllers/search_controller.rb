class SearchController < ApplicationController
  def index
    zip_code = params["q"]
    conn = Faraday.new(url: "https://developer.nrel.gov")

    response = conn.get "/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['API_KEY']}&location=#{zip_code}"

    @stations = JSON.parse(response.body)
  end
end
