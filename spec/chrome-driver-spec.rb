require_relative "spec_helper.rb"

# ================= BEFORE RUNNING TEST ===================
# 1. Install chromedriver
#    https://chromedriver.storage.googleapis.com/index.html
# 2. Export or set the PATH variable (optional):
#    % export PATH=$PATH:/path/to/chromedriver
# ====================== NOTE =============================
# Download version 2.35, issues with 2.9
# =========================================================

driver = Selenium::WebDriver.for(:chrome)
driver.navigate.to "http://google.com"
sleep 1 # wait 1 second
driver.quit
