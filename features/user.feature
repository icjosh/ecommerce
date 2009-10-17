@user
Feature: User Management
  In order to provide a custom user environment
  As a convenient way for storing user data and using access control
  I want to have regular users and admins, logins and logouts, registers, etc.

  Scenario: Register
    Given I am on the root page
    And I follow "Register"
    And I fill in the following:
      | Username 	      | blackxored2                |
      | Email                 | adrianperez.deb2@gmail.com |
      | Password              | elite2009		   | 
      | Password confirmation | elite2009                  | 
    And I press "Save"
    Then I should see "Registration succesful."
    And I should see "Logged in as: blackxored2"

  Scenario: Login
    Given I have user with name "blackxored2" and password "elite2010"
    And I am on the root page
    And I follow "Login"
    And I fill in "Username" with "blackxored2"
    And I fill in "Password" with "elite2010"
    And I press "Sign in"
    Then I should see "Logged in as: blackxored2"

  Scenario: Logout
    Given I have user with name "blackxored2" and password "elite2010"
    And I am on the root page
    And I follow "Login"
    And I fill in "Username" with "blackxored2"
    And I fill in "Password" with "elite2010"
    And I press "Sign in"
    And I follow "Logout"
    Then I should see "Succesfully logged out."
    And I should not see "Logged in as"
