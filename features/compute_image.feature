Feature: computing images based off input coefficient parameters
 
  As an optometry student
  I want to be able input coefficients and parameters into Zernike equation
  So I can generate images resulting from the Zernike equation


Scenario: computing images using default values and selecting wavefront analysis
  Given I am on the "home" page
  And I check "options[Wavefront]"
  And I press "Compute!"
  And I wait for 2 seconds
  Then I should see the wavefront image that corresponds to the default parameters
  

Scenario: computing images using manually entered values and selecting wavefront analysis
  Given I am on the "home" page
  And I press "Enter Manually"
  Then I am on the "manual" page
  And I fill in "4321" for "1" 
  And I press "Save"
  Then I am on the "home" page
  And I check "options[Wavefront]"
  And I press "Compute"
  And I wait for 2 seconds
  Then I should see the wavefront image that corresponds to those parameters