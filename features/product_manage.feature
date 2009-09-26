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

  Scenario Outline: Product Creation
    Given I have no products
    And I am on the list of products
    When I follow "New Product"
    And I fill in the following:
      | Title       | <title> |
      | Price       | <price> |                                   
      | Description | Dummy   |
      | Image url   | <url>   |
    And I press "Create"
    Then I should <action>
    

    Examples:
      | title             | price   | url          | action                                       | 
      | Motorola V3 Phone | 50.50   | motorola.jpg | see "Product was successfully created."      |
      | Nokia Phone       | -75.25  | nokia.jpg    | not see "Product was succesfully created"    |
      | Harry Potter Book | 25.25   | potter.doc   | not see "Product was succesfully created."   |
      