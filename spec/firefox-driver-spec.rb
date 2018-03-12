require_relative "spec_helper.rb"

# ================= BEFORE RUNNING TEST =================
# 1. Install geckodriver
#    https://github.com/mozilla/geckodriver/releases
# 2. Export or set the PATH variable (optional):
#    % export PATH=$PATH:/path/to/geckodriver
# =======================================================

driver = Selenium::WebDriver.for :firefox
driver.navigate.to "http://google.com"

element = driver.find_element(:name, 'q')
element.send_keys "Hello Selenium WebDriver!"
element.submit

puts driver.title
