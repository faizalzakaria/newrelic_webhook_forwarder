
######################################
# Main
######################################

task :environment do
  ENV['RACK_ENV'] ||= 'development'
  require File.expand_path('../config/environment', __FILE__)
end

desc 'Print compiled grape routes'
task routes: :environment do
  NewRelicWebhookForwarder::API.routes.each do |route|
    puts route
  end
end

Dir.glob('lib/tasks/*.rake').each { |r| load r }

