Feature: upload a .zer file 
    In order to upload coefficients from a file
    As a student 
    I want to be able to upload a .zer file with the coefficient data

Background: we start with an empty database

Scenario: uploading Zernike coefficients correctly from a file
    Given I am on the "home" page
    Then I press "Read from File"
    When I upload a file with valid coefficients
    Then I should see "File successfully uploaded!" 

Scenario: trying to upload an incomplete file #e.g. only 60 coefficients listed in file
    Given I am on the "home" page
    Then I press "Read from File"
    When I upload a file with invalid coefficients
    Then I should see "Unable to upload file"
  
 Scenario: trying to upload a corrupt file #e.g. unreadable type 
    Given I am on the "home" page
    Then I press "Read from File"
    When I upload a not .zer file type
    Then I should see "Unable to upload file"
  