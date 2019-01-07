# frozen_string_literal: true

# Fill text into form field
#
# @yieldparam field [String] Field name.
# @yieldparam value [String] Field value.
# @yieldparam selector [String] Define scope per css selector.
When(/^(?:|I )fill in "([^"]*)" for "([^"]*)"(?: within "([^"]*)")?$/) do |value, field, selector|
  with_scope selector do
    fill_in field, with: value
  end
end

# Use this to fill in an entire form with data from a table. Example:
#
#   When I fill in the following:
#     | Account Number | 5002       |
#     | Expiry date    | 2009-11-01 |
#     | Note           | Nice guy   |
#     | Wants Email?   |            |
#
# TODO: Add support for checkbox, select og option
# based on naming conventions.
#
# @yieldparam selector [String] Define scope per css selector.
# @yieldparam fields [Hash] See above
When(/^(?:|I )fill in the following(?: within "([^"]*)")?:$/) do |selector, fields|
  with_scope selector do
    fields.rows_hash.each do |name, value|
      step %(I fill in "#{value}" for "#{name}")
    end
  end
end

# Select value with form select box
#
# @yieldparam value [String] Field value.
# @yieldparam field [String] Field name.
# @yieldparam selector [String] Define scope per css selector.
When(/^(?:|I )select "([^"]*)" from "([^"]*)"(?: within "([^"]*)")?$/) do |value, field, selector|
  with_scope selector do
    select value, from: field
  end
end

# Activate checkbox.
#
# @yieldparam field [String] Field name.
# @yieldparam selector [String] Define scope per css selector.
When(/^(?:|I )check "([^"]*)"(?: within "([^"]*)")?$/) do |field, selector|
  with_scope selector do
    check field
  end
end

# Deactivate checkbox.
#
# @yieldparam field [String] Field name.
# @yieldparam selector [String] Define scope per css selector.
When(/^(?:|I )uncheck "([^"]*)"(?: within "([^"]*)")?$/) do |field, selector|
  with_scope selector do
    uncheck field
  end
end

# Activate radiobutton
#
# @yieldparam field [String] Field name.
# @yieldparam selector [String] Define scope per css selector.
When(/^(?:|I )choose "([^"]*)"(?: within "([^"]*)")?$/) do |field, selector|
  with_scope selector do
    choose field
  end
end

# Attach file to field.
#
# @yieldparam path [String] Path to file.
# @yieldparam field [String] Field name.
# @yieldparam selector [String] Define scope per css selector.
When(/^(?:|I )attach the file "([^"]*)" to "([^"]*)"(?: within "([^"]*)")?$/) do |path, field, selector|
  with_scope selector do
    attach_file field, path
  end
end

# Check if value of given form field match current value.
#
# @yieldparam field [String] Field name.
# @yieldparam selector [String] Define scope per css selector.
# @yieldparam value [String] Value to check.
Then(/^"([^"]*)" (should|should not) be contained in field "([^"]*)"(?: within "([^"]*)")?$/) do |value, should_or_not, field, selector|
  should_or_not = should_or_not.eql? 'should'
  with_scope selector do
    field = find_field field
    field_value = field.tag_name == 'textarea' ? field.text : field.value
    decision = field_value =~ /#{value}/
    expect(decision).to(should_or_not ? be_truthy : be_falsey)
  end
end

# Check if value of given form field match exactly the current value or not.
#
# @yieldparam field [String] Field name.
# @yieldparam selector [String] Define scope per css selector.
# @yieldparam negate [Boolean] Negative check?
# @yieldparam value [String] Value to check.
Then(/^"([^"]*)" should( not)? be equal to field "([^"]*)"(?: within "([^"]*)")?$/) do |value, negate, field, selector|
  expectation = negate ? :not_to : :to
  with_scope selector do
    field = find_field(field)
    field_value = field.tag_name == 'textarea' ? field.text : field.value
    if value.nil? # Capybara returns nil for empty fields, so we can't test for equality
      expect(field_value).send(expectation, be_blank)
    else
      expect(field_value).send(expectation, eq(value))
    end
  end
end

# Check if checkbox or radio button is (not) checked.
#
# @yieldparam field [String] Field name.
# @yieldparam selector [String] Define scope per css selector.
Then(/^(should|should not) be checked "([^"]*)"(?: within "([^"]*)")?$/) do |should_or_not, field, selector|
  should_or_not = should_or_not.eql? 'should'
  with_scope selector do
    field_checked = find_field(field)['checked']
    expect(field_checked).to(should_or_not ? be_truthy : be_falsey)
  end
end

# Lost focus of current field. Execute event "blur".
#
# @yieldparam field [String] Field name.
# @yieldparam selector [String] Define scope per css selector.
When(/^I leave the field "([^"]*)"(?: within "([^"]*)")?$/) do |field, selector|
  with_scope selector do
    field = find_field(field).trigger 'blur'
  end
end

# Submit form by id.
#
# @yieldparam form_id [String] Form id.
Then(/^I submit form "([^\"]*)"?$/) do |form_id|
  page.execute_script "document.forms['#{form_id}'].submit();"
end
