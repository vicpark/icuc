Feature: inputting parameters into the Zernike equation
 
  As an optometry student
  I want to be able manually input coefficients into Zernike equation
  So that I manually change the parameters
  
  
Scenario: manually inputting Zernike equation parameters, only changing z1
  Given I am on the "home" page
  # And I should see all zeroes for the Zernike cofficients
  And I press "enter manually"
  Then I am on the "manual" page
  And I fill in "4321" for "0" 
  And I press "Save"
  Then I am on the "home" page
  And I should see "4.32e+03"
