# frozen_string_literal: true

# Cucumber step helper function for selector_for
#
module HtmlSelectorsHelpers
  # Maps a name to a selector. Used primarily by the
  #
  #   When /^(.+) within (.+)$/ do |step, scope|
  #
  # step definitions in web_steps.rb
  #
  def selector_for(locator)
    locator
  end
end

World(HtmlSelectorsHelpers)
