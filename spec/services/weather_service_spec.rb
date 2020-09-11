require './spec/spec_helper'
require 'sinatra'
require 'dotenv'
Dotenv.load
require 'json'
require 'pry'
require '/Users/cece/turing/3mod/projects/weather_music/app/services/weather_service'
require '/Users/cece/turing/3mod/projects/weather_music/app/poros/forecast'
require '/Users/cece/turing/3mod/projects/weather_music/app/serializers/forecast_serializer'

describe WeatherService do
  context "instance methods" do
    context "#forecast" do
      it "returns current weather data for a particular location city, state, country" do
        location = "denver, co, usa"

        GET "/weather_playlist?units=imperial&q=#{location}"

        expect(response).to be_successful

        weather = JSON.parse(response.body, symbolize_names: true)

        expect(weather).to be_a Hash
        expect(weather).to have_key :weather
        expect(weather[:weather]).to be_an Array
        expect(weather[:weather][0]).to be_a Hash
        expect(weather[:weather][0]).to have_key :id
        expect(weather[:weather].first).to have_key :main
        expect(weather[:weather].first).to have_key :description
        expect(weather[:weather].first).to have_key :icon

        expect(weather).to have_key :main
        expect(weather[:main]).to be_an Hash
        expect(weather[:main]).to have_key :temp
        expect(weather[:main]).to have_key :temp_min
        expect(weather[:main]).to have_key :temp_max

        expect(weather).to have_key :wind
        expect(weather[:wind]).to be_a Hash

        expect(weather[:name]).to eq("Denver")
      end

      it "returns current weather data for a particular location city, country" do
        location = "santiago, chi"

        get "/weather_playlist?units=imperial&q=#{location}"

        expect(response).to be_successful

        weather = JSON.parse(response.body, symbolize_names: true)

        expect(weather).to be_a Hash
        expect(weather).to have_key :weather
        expect(weather[:weather]).to be_an Array
        expect(weather[:weather][0]).to be_a Hash
        expect(weather[:weather][0]).to have_key :id
        expect(weather[:weather].first).to have_key :main
        expect(weather[:weather].first).to have_key :description
        expect(weather[:weather].first).to have_key :icon

        expect(weather).to have_key :main
        expect(weather[:main]).to be_an Hash
        expect(weather[:main]).to have_key :temp
        expect(weather[:main]).to have_key :temp_min
        expect(weather[:main]).to have_key :temp_max

        expect(weather).to have_key :wind
        expect(weather[:wind]).to be_a Hash

        expect(weather[:name]).to eq("Santiago")
      end

      it "returns current weather data for a particular location city" do
        location = "salt lake city"

        get "/weather_playlist?units=imperial&q=#{location}"

        expect(response).to be_successful

        weather = JSON.parse(response.body, symbolize_names: true)

        expect(weather).to be_a Hash
        expect(weather).to have_key :weather
        expect(weather[:weather]).to be_an Array
        expect(weather[:weather][0]).to be_a Hash
        expect(weather[:weather][0]).to have_key :id
        expect(weather[:weather].first).to have_key :main
        expect(weather[:weather].first).to have_key :description
        expect(weather[:weather].first).to have_key :icon

        expect(weather).to have_key :main
        expect(weather[:main]).to be_an Hash
        expect(weather[:main]).to have_key :temp
        expect(weather[:main]).to have_key :temp_min
        expect(weather[:main]).to have_key :temp_max

        expect(weather).to have_key :wind
        expect(weather[:wind]).to be_a Hash

        expect(weather[:name]).to eq("Salt Lake City")
      end
    end
  end
end
