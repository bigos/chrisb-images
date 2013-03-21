Feature: PasswordReset
  In to solve forgotten password problem
  As a registered user
  I want to change my password

  Background:
    Given following user does exist:
    | username | james_bond          |
    | password | oldPass             |
    | email    | user007@example.com |
  Scenario: Successful password reset
    Given I am not logged in
    And I am on the homepage
    And I follow "Login"
    And I follow "I forgot my password"
    Then I should see password reset form

    When I fill in following:
    | password              | newSecret |
    | password confirmation | newSecret |
    And I press "Submit"   
    Then I should see message about email activation
    And should get password reset email
    When I visit password reset link
    Then I should be on password reset success page

    When I am not logged in
    And I am on the homepage
    When I follow "Login"
    And I fill in the following:
      | username      | james_bond |
      | Password      | newSecret  |
    And I press "Login"
    Then I should be on the user page
    And I should see "Logout"

