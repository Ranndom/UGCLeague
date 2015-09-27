require 'rspec'
require 'webmock/rspec'

def load_fixture(fixture)
    File.new(File.dirname(__FILE__) + "/fixtures/#{fixture}.json")
end

require File.expand_path("../../lib/ugcleague", __FILE__)

RSpec.configure do |config|
end

def stub_get(url, fixture)
    stub_request(:get, "http://www.ugcleague.com#{url}")
        .with(:headers => {:Accept => 'application/json'})
        .to_return(:body => load_fixture(fixture))
end

def a_get(url)
    a_request(:get, "http://www.ugcleague.com#{url}")
end
