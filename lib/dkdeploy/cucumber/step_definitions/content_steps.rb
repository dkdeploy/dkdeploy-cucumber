# Check json body.
#
# @yieldparam expected_json [String] Expected json string.
Then(/^(?:|I )should see JSON:$/) do |expected_json|
  require 'json'
  expected = JSON.pretty_generate(JSON.parse(expected_json))
  actual   = JSON.pretty_generate(JSON.parse(page.text))
  expect(actual).to eq(expected)
end

# Search text on page.
#
# @yieldparam text [String] Text to search on page.
# @yieldparam selector [String] Define scope per css selector.
Then(/^(?:|I )(should|should not) see "([^"]*)"(?: within "([^"]*)")?$/) do |should_or_not, text, selector|
  should_or_not = should_or_not == 'should'
  with_scope(selector) do
    expect(page).to(should_or_not ? have_content(text) : have_no_content(text))
  end
end

# Search regex on page.
#
# @yieldparam regexp [String] Regex to search on page.
# @yieldparam selector [String] Define scope per css selector.
Then(%r{^(?:|I )(should|should not) see /([^/]*)/(?: within "([^"]*)")?$}) do |should_or_not, regexp, selector|
  regexp = Regexp.new(regexp)
  should_or_not = should_or_not == 'should'
  with_scope(selector) do
    expect(page).to(should_or_not ? have_content(regexp) : have_no_content(regexp))
  end
end

# Search for xpath existance on page.
#
# @yieldparam xpath [String] xpath to search on page.
# @yieldparam selector [String] Define scope per css selector.
Then(/^(?:|I )(should|should not) see xpath "([^"]*)"(?: within "([^"]*)")?$/) do |should_or_not, xpath, selector|
  should_or_not = should_or_not == 'should'
  with_scope(selector) do
    expect(page).to(should_or_not ? have_xpath(xpath) : have_no_xpath(xpath))
  end
end

# Check if ruby can parse content within scope as element.
#
# @yieldparam selector [String] Define scope per css selector.
Then(/^I should see a date within "([^"]*)"$/) do |selector|
  with_scope(selector) do
    require 'date'
    expect(Date.parse(page.text)).not_to be_nil
  end
end

# Check if element is visible.
#
# @yieldparam element [String] Css selector for element.
Then(/^the element "([^"]*)" (should|should not) be visible$/) do |element, should_or_not|
  should_or_not = should_or_not == 'should'
  element = find(selector_for(element).to_s, visible: false)
  expect(element.visible?).to should_or_not ? be_truthy : be_falsey
end

# Check if at least x elements are existant
#
# @yieldparam number_of_elements [String] Count of elements.
# @yieldparam selector [String] Css selector for elements.
# @yieldparam parent [String] Define scope per css selector.
Then(/^I should have at least (\d+) "([^"]*)" within "([^"]*)"$/) do |number_of_elements, selector, parent|
  with_scope(parent) do
    elements = all(selector_for(selector))
    expect(elements.size).to be >= number_of_elements.to_i
  end
end

# Check if page has a certain title.
#
# @yieldparam selector [String] Define page title.
Then(/^the page should have a title of "([^"]*)"$/) do |title|
  expect(page).to have_title(title)
end

# Check if page has a certain title.
#
# @yieldparam selector [String] Define page title.
Then(%r{^the page title should match /([^/]*)/$}) do |title_regex|
  expect(page.title).to match(title_regex)
end
