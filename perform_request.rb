require "selenium-webdriver"
require 'rackstash'

args = [
	"--no-sandbox",
	"--headless",
	"--start-maximized",
	"--disable-dev-shm-usage"
]
caps = Selenium::WebDriver::Remote::Capabilities.chrome
caps.merge!(chrome_options: { args: args })
driver = Selenium::WebDriver.for :remote, url: ENV['SELENIUM_REMOTE_URL'], desired_capabilities: caps

driver.navigate.to ENV['APP_HOST']
element = driver.find_element(tag_name: 'body')

# logger = Rackstash::Logger.new('app.log')
# logger.info element.text

driver.quit