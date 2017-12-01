require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
#require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

Given /I am on the "(.+)" page$/  do |page|
    case page
    when "home"
      visit (root_path)
    when "manual"
      visit ('/manual')
    end
end

Given(/^I should see all zeroes for the Zernike cofficients$/) do
  @test_vals = Zernike.zernikes
  puts @test_vals
  assert_equal([0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], @test_vals, failure_message=nil)
end

When /^(?:|I )go to "(.+)"$/  do |page_name|
    visit('/zernikes')
    # visit path_to(page_name)
end

Then /^I click "(.+)"$/ do |link|
    click_link(link)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )fill in "([^"]*)" for "([^"]*)"$/ do |value, field|
  fill_in(field, :with => value)
end


When /^(?:|I )press "(.*)"$/ do |button|
  click_button(button)
end

Then /^I should see "(.*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^I should not see "(.*)"$/ do |text|
  if page.respond_to? :should
    page.should !have_content(text)
  else
    assert page.has_content?(text)
  end
end


Then /^(?:|I )should go to "(.+)"$/  do |page_name|
  visit('/zernikes')
end

When /^I upload a file with valid coefficients/ do
  # pending
  attach_file(:zernike_attachment, File.join('./features', 'Subject1_600.zer'), visible: 'false')
  click_button "Upload"
end

When /^I upload a file with invalid coefficients/ do
  # pending
  attach_file(:zernike_attachment, File.join('./features', 'Subject1_600_corrupted.zer'), visible: 'false')
  click_button "Upload"
end

Then /^(?:|I )should go to "(.+)"$/  do |page_name|
  visit('/zernikes')
end

When /^(?:|I )check "(.+)"$/ do |field|
  check(field)
end


When /^I upload a not .zer file type/ do
  # pending
  attach_file(:zernike_attachment, File.join('./features', 'compMTF_FFTbased.m'), visible: 'false')
  click_button "Upload"
end
                                                                                                         

Then(/^I should go to input page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I input the following "([^"]*)" for "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

Given /^I wait for (\d+) seconds?$/ do |n|
  sleep(n.to_i)
end

Then /^"([^\"]*)" field contain "([^\"]*)"$/ do |field, value|
  field_labeled(field).value.should =~ /#{value}/
end

# regex matching for generating_image feature
Given(/^I press the download all images button$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should download all the images$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I press download for one specific images$/) do
   # Compatible only with the 169.229.228.246 server, which runs the calculations and produces images 
   # to the app/assets/images folder. 
   # functionality works with the 169.229.228.246 server
end

Then(/^I should download one image$/) do
   # Compatible only with the 169.229.228.246 server, which runs the calculations and produces images 
   # to the app/assets/images folder. 
   # functionality works with the 169.229.228.246 server
end

#regex matching for compute image feature

Given(/^I press the wavefront checkbox$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the wavefront image that corresponds to the default parameters$/) do
   # Compatible only with the 169.229.228.246 server, which runs the calculations and produces images 
   # to the app/assets/images folder. 
   # functionality works with the 169.229.228.246 server
end

Then(/^I should see the wavefront image that corresponds to those parameters$/) do
   # Compatible only with the 169.229.228.246 server, which runs the calculations and produces images 
   # to the app/assets/images folder. 
   # functionality works with the 169.229.228.246 server
end
