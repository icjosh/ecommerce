@user
Feature: User Management
  In order to provide a custom user environment
  As a convenient way for storing user data and using access control
  I want to have regular users and admins, logins and logouts, registers, etc.

  Background: 
    Given I have no users
    Given I have user with name "testuser1" and password "testpw1"
    And I am on the root page

  Scenario: Register
    Given I follow "Register"
    And I fill in the following:
      | Username 	      | testuser2             |
      | Email                 | testuser2@example.com |
      | Password              | testpw1		      | 
      | Password confirmation | testpw1               | 
    And I press "Save"
    Then I should see "Registration succesful."
    And I should see "Logged in as: testuser2"

  Scenario: Login
    Given I follow "Login"
    And I fill in "Username" with "testuser1"
    And I fill in "Password" with "testpw1"
    And I press "Sign in"
    Then I should see "Logged in as: testuser1"

  Scenario: Logout
    Given I follow "Login"
    And I fill in "Username" with "testuser1"
    And I fill in "Password" with "testpw1"
    And I press "Sign in"
    And I follow "Logout"
    Then I should see "Succesfully logged out."
    And I should not see "Logged in as"

  Scenario: Edit Profile
    Given I follow "Login"
    And I fill in "Username" with "testuser1"
    And I fill in "Password" with "testpw1"
    And I press "Sign in"
    And I follow "Profile"
    And I fill in "Email" with "textuser1@example.com"
    And I press "Save"
    Then I should see "User Profile was successfully updated."
    And I should be on the root page
