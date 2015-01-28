$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'boot'
require 'socket'
require 'dotenv'
Dotenv.load
Bundler.require :default, ENV['RACK_ENV']

# Require app
require_all "api"
require_all 'app'
require_all 'lib'
