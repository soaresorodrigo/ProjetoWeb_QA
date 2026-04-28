Feature: Shopping Cart

    Background: 
        Given I am on the login page
        When I log in with "standard_user" and "secret_sauce"

    @smoke @cart
    Scenario: Add an item to the cart 
        And I add the "Sauce Labs Backpack" to my cart 
        Then the shopping cart badge should show "1"

    @cart
    Scenario: Add two items to the cart
        When I add the "Sauce Labs Backpack" to my cart
        And I add the "Sauce Labs Bike Light" to my cart
        Then the shopping cart badge should show "2"
