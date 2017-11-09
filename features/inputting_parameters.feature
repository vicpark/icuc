Feature: inputting parameters into the Zernike equation
 
  As an optometry student
  I want to be able input parameters into Zernike equation
  So I can generate the Zernike equation

Scenario: manually inputting Zernike equation parameters, only changing z1
  Given I am on the "home" page
  # And I should see all zeroes for the Zernike cofficients
  And I press "enter manually"
  Then I am on the "manual" page
  And I fill in "4321" for "0" 
  And I press "Save"
  Then I am on the "home" page
  And I should see "4.32e+03"
  



Scenario: using default paramter values without changes
  Given I am on the "home" page
  And I press "Compute"
  And I wait for 15 seconds
  And I press "home page"
  Then I am on the "home" page
  And "0" field contain "3"