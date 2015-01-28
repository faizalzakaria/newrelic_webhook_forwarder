module NewRelicWebhookForwarder
  class HealthCheck < Grape::API
    version 'v1', using: :header, vendor: 'fainow'

    rescue_from :all

    get '/' do
      { status: 'green' }
    end
  end
end
