Feature: Remove product from cart

  Background:
    Given I am on the login page
    When I log in with "standard_user" and "secret_sauce"

  Scenario Outline: Remove multiple items from the cart
    Given I add the "<product_name>" to my cart
    And I visit the cart page
    When I remove the "<product_name>" from my cart
    Then the shopping cart badge should not be visible

  Examples:
    | product_name              |
    | Sauce Labs Backpack       |
    | Sauce Labs Bike Light     |
    | Sauce Labs Bolt T-Shirt   |