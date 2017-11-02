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
    else
      assert 
    end
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
                                                                                                         

Then(/^I should go to input page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I input the following "([^"]*)" for "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

