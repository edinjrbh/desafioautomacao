require "capybara/cucumber"
require "selenium-webdriver"
require "rspec"
require "cucumber"
require "site_prism"
require "pry"

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 10
Capybara.register_driver :selenium_firefox do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox, marionette: true)
end
