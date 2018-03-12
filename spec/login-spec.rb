require_relative "spec_helper.rb"

describe "Selenium Recipes - Start different browsers" do
  # Runs the block one time before all of the examples are run
  before(:all) do
    @driver = Selenium::WebDriver.for(:chrome)
  end
  
  # Runs the block one time before each of your specs in the file
  # Resets instance variables in the before block every time 
  # an it block is run.
  before(:each) do
    @driver.navigate.to("http://localhost:3000/admin")
  end

  it "Invalid Login" do
    @driver.find_element(:id, "admin_email").send_keys("invalid@email.com")
    @driver.find_element(:id, "admin_password").send_keys("invalidpwd")
    @driver.find_element(:name, "commit").click	
    sleep 2 # wait 2 seconds
    expect(@driver.page_source).to include("Forgot your password?")
    puts "Invalid login - PASS"
  end
  
  it "Login successfully" do
    @driver.find_element(:id, "admin_email").send_keys("valid@email.com")
    @driver.find_element(:id, "admin_password").send_keys("validpwd")
    @driver.find_element(:name, "commit").click	
    sleep 2 # wait 2 seconds
    expect(@driver.page_source).to include("Signed in successfully.")
    puts "Login successfully - PASS"
  end

  after(:all) do
    @driver.quit
  end
end
