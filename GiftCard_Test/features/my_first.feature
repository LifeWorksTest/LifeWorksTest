Feature: Lifeworks test feature

  Scenario: As a valid user I can log into my app
    Given the app has launched    
    Then I change the API Environment to test    
    Then I tap on Login button    
    Then I enter username as "lifeworkstestuser3@gmail.com"    
    Then I tap continue button    
    Then I enter password "usertestpassword1"    
    Then I tap Login button
    Then I tap on Skip button
    Then I tap on New Post
    Then I enter post as "calabash testing!" and submit
    Then I select Gift Cards from Perks
    Then I select Marks & Spencer
    Then I buy the gift card
    Then I logout
    And I wait for 8 seconds


  Scenario: As a valid user I can log into the app and pay without entering card details
    Given the app has launched    
    Then I change the API Environment to test    
    Then I tap on Login button    
    Then I enter username as "lifeworkstestuser3@gmail.com"    
    Then I tap continue button    
    Then I enter password "usertestpassword1"    
    Then I tap Login button
    Then I tap on Skip button
    Then I tap on New Post
    Then I enter post as "calabash testing!" and submit
    Then I select Gift Cards from Perks
    Then I select Marks & Spencer
    Then I tap on Pay button without entering card details
