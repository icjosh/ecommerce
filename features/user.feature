@user
Feature: User Management
  In order to provide a custom user environment
  As a convenient way for storing user data and using access control
  I want to have regular users and admins, logins and logouts, registers, etc.

  Background: 
    Given I have no users
    And I create user with name "testuser1" and password "testpw1"
    And I am on the root page

  Scenario: Register
    When I follow "Register"
    And I fill in the following:
      | Username 	      | testuser2             |
      | Email                 | testuser2@example.com |
      | Password              | testpw1		      | 
      | Password confirmation | testpw1               | 
    And I press "Save"
    Then I should see "Registration succesful."
    And I should see "Logged in as: testuser2"

    Scenario Outline: Login
      When I follow "Login"
      And I fill in the following:
        | Username | <username> |
	| Password | <password> |
      And I press "Sign in"			
      Then I should <action>

      Examples:
        | username   | password | action                                   |
	| testuser1  | testpw1  | see "Logged in as: testuser1"            |
	| testuser1  | testpw2  | see "Invalid login/password combination" |
  
  Scenario: Logout
    Given I am logged in with user "testuser1" and password "testpw1"
    When I follow "Logout"
    Then I should see "Succesfully logged out."
    And I should not see "Logged in as"

  Scenario: Edit Profile
    Given I am logged in with user "testuser1" and password "testpw1"
    When I follow "Profile"
    And I fill in "Email" with "textuser1@example.com"
    And I press "Save"
    Then I should see "User Profile was successfully updated."
    And I should be on the root page
