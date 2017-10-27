Feature: inputting parameters into the Zernike equation
 
  As an optometry student
  I want to be able input parameters into Zernike equation
  So I can generate the Zernike equation

Scenario: manually inputting Zernike equation parameters with zero changes
  Given I am on "the home page"
  And I press "enter manually"
  #Then I should go to input page
  And I press "Save"
  Then I should go to "the home page" 
  And I should see "Zernike equation successfully computed!"
  # Victoria rewrote this because it now redirects to the homepage
  
  
Scenario: manually inputting Zernike equation parameters, only changing z1
  Given I am on "the home page"
  And I press "enter manually"
  #Then I should go to input page
  #And I input the following "1" for "Z1" 
  And I press "Save"
  Then I should go to "the home page" 
  And I should see "Zernike equation successfully computed!"