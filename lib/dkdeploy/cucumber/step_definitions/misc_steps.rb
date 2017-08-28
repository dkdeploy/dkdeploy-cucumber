# Hover given element.
#
# @yieldparam element [String] Css selector for element.
When(/^I hover over "([^"]*)"$/) do |element|
  element = find(selector_for(element).to_s)
  element.hover
end

# Test for css attribute value
#
Then(/^the element "([^"]*)" should have a css attribute "([^"]*)" with value "([^"]*)"$/) do |element, css_key, value|
  expect(page.evaluate_script("jQuery('#{selector_for(element)}').css('" + css_key + "')")).to have_content(value)
end

# Test for attribute value
#
Then(/^the element with xpath "([^"]*)" should have an attribute "([^"]*)" with (the exact )?value "([^"]*)"$/) do |element, attr, exact, value|
  xpath_attribute_compare = exact ? '[@' + attr + '="' + value + '"]' : '[contains("' + value + '", ' + attr + ')]'

  xpath_path = element + xpath_attribute_compare

  if page.respond_to? :should
    expect(page).to have_xpath(xpath_path)
  else
    assert page.has_xpath?(xpath_path)
  end
end

# Test for class attribute value
#
Then(/^the element "([^"]*)" should have class "([^"]*)"$/) do |element, value|
  expect(page.evaluate_script("jQuery('#{selector_for(element)}').hasClass('" + value + "')")).to be_truthy
end

# Test for absence of class attribute value
#
Then(/^the element "([^"]*)" should not have class "([^"]*)"$/) do |element, value|
  expect(page.evaluate_script("jQuery('#{selector_for(element)}').hasClass('" + value + "')")).to be_falsey
end

Then(/^I should have exactly "(\d+) ([^"]*)" within "([^"]*)"$/) do |number_of_elements, selector, parent|
  with_scope(parent) do
    elements = all(selector_for(selector))
    expect(elements.size).to eq(number_of_elements.to_i)
  end
end

Then(/^I should have not more than "(\d+) ([^"]*)" within "([^"]*)"$/) do |number_of_elements, selector, parent|
  with_scope(parent) do
    elements = all(selector_for(selector))
    expect(elements.size).to be <= number_of_elements.to_i
  end
end

Then(/^the element "([^"]*)" should not be visible after waiting (\d) seconds$/) do |element, seconds|
  sleep(seconds.to_i)
  expect(page.evaluate_script("jQuery('#{selector_for(element)}').is(':visible')")).to be_falsey
end

Then(/^the element "([^"]*)" should be visible after waiting (\d) seconds$/) do |element, seconds|
  sleep(seconds.to_i)
  expect(page.evaluate_script("jQuery('#{selector_for(element)}').is(':visible')")).to be_truthy
end

And(/^all elements "([^"]*)" within "([^"]*)" should have the class "([^"]*)"$/) do |selector, parent, value|
  with_scope(parent) do
    expect(all(selector_for(selector)).size).to eq(all(selector_for("#{selector}#{value}")).size)
  end
end

Then(/^I native hover the element "([^"]*)"$/) do |element|
  element = selector_for(element)
  page.find(element).native.hover
end

# Test the page title
#
Then(/^I should see the page titled "([^\"]*)"$/) do |title|
  expect(page).to have_title(title)
end

# use only for debugging
#
Then(/^I take a screenshot$/) do ||
  page.save_screenshot('./cucumber_debug_screenshot.png', full: true)
end

# Save current page.
#
Then(/^show me the page$/) do
  save_and_open_page # rubocop:disable Lint/Debugger
end

# Mark current test as pending.
#
Given(/^PENDING/) do
  skip
end

# Wait x seconds.
#
# @yieldparam seconds [String] Seconds to wait.
Then(/^I wait for (\d+) seconds*$/) do |seconds|
  sleep seconds.to_i
end
