Feature: Content Checks
    Background:
        Given I am on "misc.html"

    Scenario: timer
        Then I should see "before" within "#p1"
        Then I press "b1"
        Then I wait for 1 second
        Then I should see "before" within "#p1"
        Then I wait for 3 second
        Then I should see "after" within "#p1"

    @should_fail
    Scenario: timer fail
        Then I should see "before" within "#p2"
        Then I press "b2"
        Then I wait for 1 second
        Then I should see "after" within "#p2"
