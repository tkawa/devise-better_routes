ENV['RAILS_ENV'] = 'test'

require File.expand_path('rails_app/config/environment.rb',  File.dirname(__FILE__))
require 'rspec'
require 'rspec/rails'
require 'rspec/autorun'

RSpec.configure do |config|
  # some config ...
end
