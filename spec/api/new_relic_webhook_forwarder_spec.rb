require 'spec_helper'

describe NewRelicWebhookForwarder::API do

  include Rack::Test::Methods

  def app
    NewRelicWebhookForwarder::API
  end

  describe NewRelicWebhookForwarder::HealthCheck do
    it 'should return green' do
      get '/kankong/v1/'
      assert_response_success last_response
    end
  end

  describe NewRelicWebhookForwarder::Webhook do
    it 'should return green' do
      NewRelicWebhookForwarder::SMS.any_instance.stub(:send)
      post '/kankong/v1/webhooks/newrelic'
      assert_response_success last_response
    end
  end

  def assert_response_success(response)
    [201, 200].include?(response.status).should == true
  end

  def assert_response_failed(response)
    [404, 500].include?(response.status).should == true
  end

end
