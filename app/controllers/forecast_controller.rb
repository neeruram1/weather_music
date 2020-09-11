require 'sinatra'
require 'dotenv'
Dotenv.load
require 'json'
require 'pry'
require '/Users/cece/turing/3mod/projects/weather_music/app/services/weather_service'
require '/Users/cece/turing/3mod/projects/weather_music/app/poros/forecast'
require '/Users/cece/turing/3mod/projects/weather_music/app/serializers/forecast_serializer'

  before do
     content_type 'application/json'
   end

  get "/weather_playlist" do
    location = params[:q]
    binding.pry
    weather_response = WeatherService.new.forecast(location)
    forecast = Forecast.new(weather_response)
    ForecastSerializer.new(forecast).data_hash.to_json
  end
