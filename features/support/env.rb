# frozen_string_literal: true

# Capybara configuration (using phantomjs)

require 'capybara/cucumber'
require 'phantomjs'
require 'capybara/poltergeist'
require 'rspec/expectations'

require 'dkdeploy/cucumber/steps'
require 'dkdeploy/cucumber/support'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, phantomjs: Phantomjs.path)
end
Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist
Capybara.default_selector = :css
Capybara.server = :webrick

Capybara.app = Rack::Directory.new File.expand_path('../htdocs', __dir__)

# register Capybara
World(Capybara)

# Workaround for Poltergeist
#
# needs to be deleted when headless browser engine is switched out
#
# Workaround for a bug, in newer poltergeist versions
# see https://github.com/teampoltergeist/poltergeist/issues/754
# Page object (capybara session) is fine except for status_code always returning nil when we have multiple
# successful page loads in one cucumber run
# Return value of page.visit is always {"state":'success'}
# Although it has been observed that the status_code is returned properly on a 404 error, this work-around is just to be sure
Before do
  page.driver.clear_memory_cache
end
