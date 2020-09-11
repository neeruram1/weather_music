require 'faraday'
require 'dotenv'
Dotenv.load

class WeatherService
  def forecast
    to_json("/data/2.5/weather?units=imperial&zip=80003")
  end

  private

  def conn
    Faraday.new('https://api.openweathermap.org') do |f|
      f.params[:appid] = "#{ENV['WEATHER_API']}"
    end
  end

  def to_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
