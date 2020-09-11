require 'sinatra'
require 'dotenv'
Dotenv.load
require 'rubygems'
require 'json'
require 'pry'
require_relative 'forecast'
require_relative 'forecast_serializer'
require_relative 'weather_service'


before do
   content_type 'application/json'
 end

get '/forecast' do
  response = WeatherService.new.forecast
  forecast = Forecast.new(response)
  ForecastSerializer.new(forecast).data_hash.to_json
end
