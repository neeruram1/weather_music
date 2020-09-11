class ForecastSerializer

  def initialize(forecast)
    @forecast = forecast
  end

  def data_hash
   data = {
     description: @forecast.description
   }
   data
 end
end
