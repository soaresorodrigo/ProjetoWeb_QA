Given('I am on the login page') do
    @login = LoginPage.new
    @login.load
end

When('I log in with {string} and {string}') do |user, password|    
    @login ||= LoginPage.new
    @login.log_in(user, password)
end

And('I logout') do
    @login ||= LoginPage.new
    @login.logout
end

Then('I should be redirected to the login page') do
    expect(@login.has_login_page?).to be true
end

Then('I should be redirected to the products page') do
    expect(@login.has_products_title?).to be true
end
Then('I should see an error message {string}') do |expected_message|
    expect(@login.has_error?(expected_message)).to be true  
end