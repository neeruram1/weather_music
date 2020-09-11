require 'fast_jsonapi'
class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :temp
end
