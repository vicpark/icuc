Feature: save output from computed Zernike equation
 
  As an optometry student
  I want to be able to save the images generated from the Zernike equation
  so I can study imperfections of the eye
  
Scenario: save images as a zip file
  Given I am on the "result" page
  And I click "save as zip file"
  Then I should see "Successfully downloaded zip file"

Scenario: convert an image into a pdf
  Given I am on the "result" page
  And I click "save as pdf"
  Then I should see "Successfully downloaded image as a pdf"

  