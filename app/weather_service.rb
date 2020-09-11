class WeatherService
  def self.api_response
    uri = URI.parse(URI.encode("https://api.openweathermap.org/data/2.5/weather?appid=529aaf42260736dead3fc38c62695879&units=imperial&zip=80003"))
    api_response = Net::HTTP.get(uri)
    JSON.parse(api_response)
  end
end
