@cart
Feature: Manage Cart
  In order to collect products to order
  As a convenient way to see the total price and products
  I want to have a cart for storing products

  Background:
    Given I have product titled The Lord of the Rings
    And I am on the store page

  Scenario: Hide empty Cart
    Then I should not see "Cart"

  Scenario: Add product to Cart
    When I press "Add to Cart"
    Then I should see "Cart"
    And I should have 1 item in Cart
    And I should have "The Lord of the Rings" in Cart

