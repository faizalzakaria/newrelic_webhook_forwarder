
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

######################################
# Rspec
######################################

require 'rspec/core'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/api/*_spec.rb', 'spec/models/**/*_spec.rb']
end
