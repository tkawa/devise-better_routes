ENV['RAILS_ENV'] = 'test'

require File.expand_path('rails_app/config/environment.rb',  File.dirname(__FILE__))
require 'rspec'
require 'rspec/rails'
require 'rspec/autorun'

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers, type: :helper
  config.include Devise::Controllers::UrlHelpers, type: :helper
end
