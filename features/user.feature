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
