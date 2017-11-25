# Feature: upload a .zer file 
#     As an ontometry student
#     In order to use the app, 
#     I need to be able to navigate over views

# Background: we start with an empty database
  
# Scenario: home page
#   Given I am on the "home" page
#   Then I should see "Optical Wavefront Analysis"
#   And I should see "Zernikes"
#   And I should see "Parameters"
#   And I should not see "Upload Coefficients from a File"
    
# Scenario: read from file
#   Given I am on the "home" page
#   Then I press "read from file"
#   Then I should see "Upload Coefficients from a File"
#   And I should not see "Optical Wavefront Analysis"
 
# Scenario: enter manually
#   Given I am on the "home" page
#   Then I press "enter manually"
#   Then I should see "Edit the Zernikes"
#   And I should not see "Upload Coefficients from a File"
  