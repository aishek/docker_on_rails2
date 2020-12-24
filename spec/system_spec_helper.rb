# Helper to configure system specs
require 'rails_helper'

RSpec.configure do |config|
  config.before :each, type: :system do
    if ENV['SELENIUM_URL']
      # The settings prevent system tests from failing because of memory issues or related.
      # Chrome is starting in Docker container, which run as a service on CI
      Capybara.register_driver :chrome do |app|
        Capybara::Selenium::Driver.new(
          app,
          browser: :remote,
          desired_capabilities: :chrome,
          url: ENV['SELENIUM_URL']
        ).tap do |driver|
          # To fix file uploads
          driver.browser.file_detector = lambda do |args|
            str = args.first.to_s
            str if File.exist?(str)
          end
        end
      end

      driven_by :chrome, screen_size: [1400, 1400], options: { url: ENV['SELENIUM_URL'] }

      self_host = ENV['CI'] ? "http://#{IPSocket.getaddress(Socket.gethostname)}" : 'http://host.docker.internal'
      host!(self_host)

      ActionMailer::Base.default_url_options ||= {}
      ActionMailer::Base.default_url_options[:host] = self_host

      Capybara.server_host = '0.0.0.0'
      Capybara.default_max_wait_time = 2
    else
      driven_by(:rack_test)
    end
  end
end
