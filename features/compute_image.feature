Feature: computing images based off input coefficient parameters
 
  As an optometry student
  I want to be able input coefficients and parameters into Zernike equation
  So I can generate images resulting from the Zernike equation


Scenario: computing images using default values and selecting wavefront analysis
  Given I am on the "home" page
  And I press the wavefront checkbox
  And I press "Compute"
  And I wait for 15 seconds
  Then I should see the wavefront image that corresponds to the default parameters
  

Scenario: computing images using manually entered values and selecting wavefront analysis
  Given I am on the "home" page
  And I press "enter manually"
  Then I am on the "manual" page
  And I fill in "4321" for "0" 
  And I press "Save"
  Then I am on the "home" page
  And I press the wavefront checkbox
  And I press "Compute"
  And I wait for 15 seconds
  Then I should see the wavefront image that corresponds to those parameters