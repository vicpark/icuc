Feature: inputting parameters into the Zernike equation
 
  As an optometry student
  I want to be able input parameters into Zernike equation
  So I can generate the Zernike equation
  
Scenario: uploading Zernike equation parameters from a text file
  Given I am on the "home" page
  And I click "upload text file"
  And I click "compute"
  Then I should see "Successfully computed Zernike equation"
  
Scenario: uploading Zernike equation parameters from a corrupted file
  Given I am on the "home" page
  And I click "upload text file"
  Then I should see "Unable to upload file"

Scenario: manually inputting Zernike equation parameters
  Given I am on the "home" page
  And I click "input parameters"
  Then I fill in "1" coefficient one
  And I click "compute"
  Then I should see "Successfully computed Zernike equation"


Scenario: randomly generating Zernike equation parameters
  Given I am on the "home" page
  And I click "generate random parameters"
  And I click "compute"
  Then I should see "Successfully computed Zernike equation"

Scenario: upload a text file and change one of the inputs
  Given I am on the "home" page
  And I click "upload text file"
  And I click "compute"
  Then I should see "3" for coefficient five
  When I fill in "4" for coefficient five
  Then I should see "4" for coefficient five
  And I click "compute"
  Then I should see "Successfully computed Zernike equation"
  