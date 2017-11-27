Feature: generating images and saving output from computed Zernike equation
 
  As an optometry student, 
  I want to be able to save the images outputted from the zernike equation,
  so that I can use the images for studying later.
  
Scenario: downloading all images outputed from zernike equation
  Given I am on the "home" page
  And I check "options[Wavefront]" 
  And I press "Compute!"
  And I wait for 5 seconds
  And I press the download all images button
  Then I should download all the images
 

Scenario: downloading one image outputted from the zernike equation
  Given I am on the "home" page
  And I check "options[Wavefront]"
  And I press "Compute!"
  And I wait for 5 seconds
  And I press download for one specific images
  Then I should download one image



  