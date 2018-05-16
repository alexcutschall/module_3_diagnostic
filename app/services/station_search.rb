class StationSearch
  def initialize(params)
    @params = params
  end

  def stations
    zip_code = params["q"]
    conn = Faraday.new(url: "https://developer.nrel.gov")

    response = conn.get "/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['API_KEY']}&location=#{zip_code}&limit=10&fuel_type=LPG, ELEC"

    raw_stations = JSON.parse(response.body, symbolize_names: true)
    stations = raw_stations[:fuel_stations].map do |station|
      Station.new(station)
    end
  end

  private
  attr_reader :params
end
