require 'bundler'
Bundler.require
require_all 'app'

run ApplicationController
use ForecastController
