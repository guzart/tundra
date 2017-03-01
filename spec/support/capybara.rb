require 'capybara/rspec'
require 'rack/handler/puma'
require 'net/http'

WEB_TEST_URL = "http://localhost:5005".freeze

def capybara_wait_for_neutrino
  10.times.each do |_|
    begin
      Net::HTTP.get(URI(WEB_TEST_URL))
      return
    rescue Errno::ECONNREFUSED
      sleep 1
    end
  end
end

# https://github.com/teamcapybara/capybara/blob/master/lib/capybara.rb#L35
Capybara.configure do |config|
  config.default_driver = :webkit
  config.javascript_driver = :webkit

  config.register_server :tundra do |app, port, host|
    process = ChildProcess.build('neutrino', 'start')
    # process.io.inherit!
    process.environment['CAPYBARA'] = '1'
    process.environment['API_URL'] = "#{host}:#{port}"
    process.cwd = Rails.root.join('web')
    process.start
    at_exit { process.stop }
    capybara_wait_for_neutrino

    options = { Host: host, Port: port, Threads: "0:4", Silent: true }
    Rack::Handler::Puma.run(app, options)
  end

  config.server = :tundra
  config.run_server = true
  config.app_host = WEB_TEST_URL
end

# Capybara::Webkit.configure do |config|
#   # https://github.com/thoughtbot/capybara-webkit#configuration
# end

