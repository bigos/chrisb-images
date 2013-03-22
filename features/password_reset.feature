Feature: Password Reset
  In order to retrieve a lost password
  As a user of this site
  I want to reset it

  Scenario: Reset password
    Given I am not logged in
    And I am on the homepage
    When I follow "Login"

    And I follow "I forgot my password"
    Then I should see text "Reset Password"
    And I should see "Please enter your email address below"
    When I fill in "email" with "user@domain.com"
    And a user exists with email: "user@domain.com", password: "password"
    And I press "<h1>Reset Password"
    Then I should see "Instructions to reset your password have been emailed to you"
    And "user@domain.com" should have an email
    When I open the email
    Then I should see "Password Reset Instructions" in the email body
    When I follow "Reset Password" in the email
    Then I should see "Update your password"
    When I fill in "password" with "newpassword"
    And I press "Update Password"
    Then I should see "Your password was successfully updated"
    When I am not logged in
    Then I should be able to log in with email "user@domain.com" and password "newpassword"

  Scenario: Reset password no account
    Given I am not logged in
    And I am on the login page
    Then I should see "Forgot Password"
    When I follow "Forgot Password"
    Then I should see "Reset Password"
    And I should see "Please enter your email address below"
    When I fill in "email" with "user@domain.com"
    And I press "Reset Password"
    Then I should see "No user was found with email address user@domain.com"  
