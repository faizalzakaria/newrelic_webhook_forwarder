module NewRelicWebhookForwarder
  class Helper
    class << self
      def send_sms(params)
        return if alert?(params)
        message = {
          message: create_message(JSON.parse(params['alert'])),
          targets: target_numbers
        }
        SMS.new.send(message)
      end

      def send_email(params)
        # TODO
      end

      def send_slack(params)
        # TODO
      end

      def alert?(params)
        params['alert'].nil?
      end

      def deployment?(params)
        params['deployment'].nil?
      end

      private

      def target_numbers
        ENV['TARGETS_NUMBERS'].split(',') if ENV['TARGETS_NUMBERS']
      end

      def create_message(params)
        msg = "#{params['created_at']} - "
        msg << "#{params['application_name']} - "
        msg << "#{params['severity']} - "
        msg << "#{params['message']}!!!"
        msg
      end
    end
  end
end
