Feature: Content Checks
    Background:
        Given I am on "content.html"

    Scenario: see something
        Then I should see "something"

    @should_fail
    Scenario: see something fail
        Then I should see "otherthing"

    Scenario: do not see something
        Then I should not see "otherthing"

    @should_fail
    Scenario: do not see something fail
        Then I should not see "something"

    Scenario: see regexp
        Then I should see /so.{2}th.ng/

    @should_fail
    Scenario: see regexp fail
        Then I should see /so.{3}th.ng/

    Scenario: not see regexp
        Then I should not see /murks/

    @should_fail
    Scenario: not see regexp fail
        Then I should not see /thing/

    Scenario: Date
        Then I should see a date within "#date"

    @should_fail
    Scenario: Date fail
        Then I should see a date within "#falsedate"

    Scenario: Visible
        Then the element "#p1" should be visible

    @should_fail
    Scenario: Visible fail
        Then the element "#p2" should be visible

    Scenario: Invisible
        Then the element "#p2" should not be visible

    @should_fail
    Scenario: Invisible fail
        Then the element "#p1" should not be visible

    Scenario: Hover
        Then I should see "before" within "#p3"
        When I hover over "#hover"
        Then I should see "after" within "#p3"

    @should_fail
    Scenario: Hover fail
        Then I should see "before" within "#p3"
        When I hover over "#hover3"

    Scenario: At least
        Then I should have at least 6 "p" within "body"


    Scenario: JSON content
        Given I am on "content.json"
        Then I should see JSON:
        """
        {
        "test": 1
        }
        """

    @should_fail
    Scenario: JSON content fail
        Given I am on "content.json"
        Then I should see JSON:
        """
        {
        "test": 2
        }
        """

    Scenario: exact page title
        Given I am on "content.html"
        Then the page should have a title of "Empty html"

    Scenario: page title matching regex
        Given I am on "content.html"
        Then the page title should match /Empty/
        Then the page title should match /(\s){1}/
        Then the page title should match /html/
