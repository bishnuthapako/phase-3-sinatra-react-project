# This is an _environment variable_ that is used by some of the Rake tasks to determine
# if our application is running locally in development, in a test environment, or in production
# postgres branch push upstream
ENV['RACK_ENV'] ||= "development"

# Require in Gems
require 'bundler/setup'
# require 'pg'
Bundler.require(:default, ENV['RACK_ENV'])

# Require in all files in 'app' directory
require_all 'app'