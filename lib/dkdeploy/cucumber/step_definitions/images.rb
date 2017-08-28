# Test for image
#
Then(/^(?:|I )should see the image "([^"]*)"(?: within "([^"]*)")?$/) do |image, selector|
  with_scope(selector) do
    if page.respond_to? :should
      expect(page).to have_xpath("//img[contains(@src,'#{image}')]")
    else
      assert page.has_xpath?("//img[contains(@src,'#{image}')]")
    end
  end
end
