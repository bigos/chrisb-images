Feature: UserRegistration
  In order to register
  As a website visitor
  I want to register and activate my account

  Background:
    Given blah

  Scenario: Successful registration
    Given I am not logged in
    And I am on the homepage
    When I follow "Register"
    And I fill in the following:
      | login         | james_bond |
      | email         | user007@example.com |
      | Password      | secret  |
      | Password confirmation | secret |
    And I press "Register"
    Then I should get email sent to my address
    And I should see activation link in the email

  Scenario: Successful Activation
    When I visit activation link
    Then My account should get activated
    And I should see page with my user profile
