Feature: Lifeworks Technical Test


@TestScenario
  Scenario Outline: As a valid user I can log into the app  
    Given the app has launched    
    Then I change the API Environment to test    
    Then I tap on Login button    
    Then I enter username as <uname>
    Then I tap continue button    
    Then I enter password <passwd> 
    Then I tap Login button
    Then I swipe till last walkthrough slide and press GOT IT    
    Then I tap Give Recognition    
    Then I select user "Test User"    
    Then I tap on NEXT    
    Then I scroll down until I see "Superstar"
    Then I tap on "Superstar" badge
    And I wait for 2 seconds    
    Then I enter text in description "He is a superstar!"    
    Then I post the Recognition
    Then I check for the posted Recognition in newsfeed page    
    Then I tap Perks in bottom navigation    
    Then I tap on Restaurants    
    Then I make second restaurant as favourite
    Then I logout

    Examples:
    | uname                           | passwd              |
    | "lifeworkstestuser13@gmail.com" | "usertestpassword1" |
  

@TestScenario # Invalid user login test case
  Scenario: As an invalid user I cannot log into the app
    Given the app has launched 
    Then I change the API Environment to test    
    Then I tap on Login button    
    Then I enter wrong username "wrong@#$"
    Then I tap continue button    
    Then I enter password "wrong"
    Then I tap Login button
    Then I see validation message for invalid user