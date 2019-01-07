# frozen_string_literal: true

# Cucumber step helper function for with_in
#
module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end

World(WithinHelpers)
