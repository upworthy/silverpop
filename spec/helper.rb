unless ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_filter 'spec'
  end
end
require 'silverpop'
require 'rspec'
require 'webmock/rspec'
require 'pry'

def stub_post(url)
  stub_request(:post, silverpop_url(url))
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def silverpop_url(url)
  "https://api1.silverpop.com#{url}"
end
