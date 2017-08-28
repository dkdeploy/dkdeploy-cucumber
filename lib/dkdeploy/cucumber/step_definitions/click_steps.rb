# Click button.
#
# @yieldparam button [String] Name of button. Relative to selector.
# @yieldparam selector [String] Define scope per css selector.
When(/^(?:|I )press "([^"]*)"(?: within "([^"]*)")?$/) do |button, selector|
  with_scope(selector) do
    click_button(button)
  end
end

# Click link.
#
# @yieldparam button [String] Name of link. Relative to selector.
# @yieldparam selector [String] Define scope per css selector.
When(/^(?:|I )follow "([^"]*)"(?: within "([^"]*)")?$/) do |link, selector|
  with_scope(selector) do
    click_link(link)
  end
end

# Click xpath.
#
# @yieldparam xpath [String] xpath to link. Relative to selector.
# @yieldparam selector [String] Define scope per css selector.
When(/^(?:|I )click xpath "([^"]*)"(?: within "([^"]*)")?$/) do |xpath, selector|
  with_scope(selector) do
    find(:xpath, xpath).click
  end
end

# Click element.
#
# @yieldparam element [String] Css selector for element.
# @yieldparam selector [String] Define scope per css selector.
When(/^I click on element "([^"]*)"(?: within "([^"]*)")?$/) do |element, selector|
  with_scope(selector) do
    find(element.to_s).click
  end
end
