module NewRelicWebhookForwarder
  class SMS
    def connection
      @connection ||= Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_ACCOUNT_TOKEN'])  unless ENV['TWILIO_ACCOUNT_SID'].nil?
    end

    def from_number
      ENV['TWILIO_NUMBER']
    end

    def params_validated?(params)
      required_fields = %i(targets message)
      required_fields.all? { |e| params.include?(e) }
    end

    def send(params)
      fail(StandardError('Missing key in the message')) unless params_validated?(params)

      params[:targets].each do |target|
        begin
          connection.account.messages.create(
                                      from: from_number,
                                      to: target,
                                      body: params[:message]
            )
        rescue Twilio::REST::RequestError => e
          puts e
        end
      end
    end
  end
end
