Feature: Remove item Cart

  Background:
    Given I am on the login page

  Scenario: Remove an item from the cart
    When I log in with "standard_user" and "secret_sauce"
    And I add the "Sauce Labs Backpack" to my cart
    And I visit the cart page
    And I remove the "Sauce Labs Backpack" from my cart
    Then the shopping cart badge should not be visible