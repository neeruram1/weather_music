require 'sinatra'
require 'dotenv'
Dotenv.load
require 'json'
require 'pry'
require '/Users/nirupamaram/turing/3module/weather_music/app/services/weather_service'
require '/Users/nirupamaram/turing/3module/weather_music/app/poros/forecast'
require '/Users/nirupamaram/turing/3module/weather_music/app/serializers/forecast_serializer'

  before do
     content_type 'application/json'
   end

  get '/' do
    weather_response = WeatherService.new.forecast
    forecast = Forecast.new(weather_response)
    ForecastSerializer.new(forecast).data_hash.to_json
  end
