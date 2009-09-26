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
