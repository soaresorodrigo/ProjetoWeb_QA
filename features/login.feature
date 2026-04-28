Feature: User Login

    Background:
        Given I am on the login page
   
    @smoke @login
    Scenario: Successful login with valid credentials
        When I log in with "standard_user" and "secret_sauce"
        Then I should be redirected to the products page
   
    @login
    Scenario: Login with invalid password
        When I log in with "standard_user" and "wrong_password"
        Then I should see an error message "Epic sadface: Username and password do not match any user in this service"
   
    @login
    Scenario: Successful logout
        When I log in with "standard_user" and "secret_sauce"
        And I logout
        Then I should be redirected to the login page
        