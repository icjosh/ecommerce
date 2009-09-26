@focus
Feature: Manage Products
  In order to manage products
  As a central part of a e-commerce application
  I want to be create, manage and see products

  Scenario: Products List
    Given I have products titled The Lord of the Rings, Harry Potter
    And I am on the list of products
    Then I should see "The Lord of the Rings"
    And I should see "Harry Potter"
    And I should have 2 products