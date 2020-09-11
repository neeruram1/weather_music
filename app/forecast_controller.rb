require 'sinatra'
require 'rubygems'
require 'rest-client'
require 'json'
require 'pry'
require_relative 'forecast'
require_relative 'forecast_serializer'

get '/forecast' do
  response = WeatherService.api_response
  render json: ForecastSerializer.new(Forecast.new(response))
end
