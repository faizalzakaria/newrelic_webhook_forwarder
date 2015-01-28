module NewRelicWebhookForwarder
  class Webhook < Grape::API
    version 'v1', using: :header, vendor: 'fainow'

    rescue_from :all

    resource :webhooks do
      post '/newrelic' do
        { status: 'green' }
      end
    end
  end
end
