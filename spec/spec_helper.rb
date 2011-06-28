require 'rubygems'
require 'envi'
require 'rspec'

ENV["ENVI_ENV"] = 'test'

Dir["#{File.expand_path('..', __FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.color_enabled = true
end
