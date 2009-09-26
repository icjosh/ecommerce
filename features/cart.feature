@cart
Feature: Manage Cart
  In order to collect products to order
  As a convenient way to see the total price and products
  I want to have a cart for storing products

  Background:
    Given I have products titled The Lord of the Rings, Harry Potter

  Scenario: Hide empty Cart
    Given I am on the list of products
    Then I should not see "Cart"

  Scenario: Add product to Cart
    Given I am on the list of products
    And I go to the "Harry Potter" product
    And I press "Add to Cart"
    Then I should have 1 product in Cart
