Feature: inputting parameters into the Zernike equation
 
  As an optometry student
  I want to be able input parameters into Zernike equation
  So I can generate the Zernike equation

Scenario: manually inputting Zernike equation parameters
  Given I go to the home page
  And I click "input Zernike's parameters"
  Then I fill in "1" for "z1"
  Then I fill in "2" for "z1"
  Then I fill in "3" for "z3"
  Then I fill in "4" for "z4"
  Then I fill in "5" for "z5"
  Then I fill in "6" for "z6"
  Then I fill in "7" for "z7"
  Then I fill in "65" for "z65"
  And I press "Compute!"
  Then I should see "Zernike equation successfully computed!"

Scenario: uploading Zernike equation parameters from a corrupted file
  Given I go to the home page
  And I click "upload text file"
  Then I should see "Unable to upload file"