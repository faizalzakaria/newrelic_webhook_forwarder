module NewRelicWebhookForwarder
  class SMS
    def self.send(message)
      # logging
      puts message

      # verify the query
      required_fields = %w(targets message)
      required_fields.all? { |e| message.include?(e) } || fail(StandardError('SMS message didn\'t contain all required fields'))
      # get the targets
      targets = message['targets']

      if targets.count > 0
        targets.each do |target|
          begin
            @@twilio_client.account.messages.create(
              from: @@twilio_number,
              to: target,
              body: message['message']
            )
          rescue Twilio::REST::RequestError => e
            puts e
          end
        end
      end
    end
  end
end
