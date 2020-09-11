class Forecast
  attr_reader :description

  def initialize(data)
    @description = data[:weather].first[:description]
  end
end
