Feature: Shopping Cart
    Scenario: Add an item to the cart 
    Given I am on the login page
    When I log in with "standard_user" and "secret_sauce"
    And I add the "Sauce Labs Backpack" to my cart 
    Then the shopping cart badge should show "1"