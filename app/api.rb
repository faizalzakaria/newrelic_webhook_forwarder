module NewRelicWebhookForwarder
  class API < Grape::API
    prefix 'kankong/v1'
    format :json

    mount NewRelicWebhookForwarder::HealthCheck
    mount NewRelicWebhookForwarder::Webhook
  end
end
