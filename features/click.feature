Feature: Click
    Background:
        Given I am on "click.html"

    Scenario: click button
        Then I should not see "changed"
        When I press "b1"
        Then I should see "changed"

    @should_fail
    Scenario: click button fail
        When I press "b3"

    Scenario: click button within context
        Then I should not see "changed2"
        When I press "b2" within "#scope"
        Then I should see "changed2"

    @should_fail
    Scenario: click button within context fail
        When I press "b1" within "#wrong"

    Scenario: click on element
        Then I should not see "changed3"
        When I click on element "#clickelement"
        Then I should see "changed3"

    @should_fail
    Scenario: click on element fail
        When I click on element "#clickelement123"

    Scenario: follow link
        Given I am on "click1.html"
        Then I should not see "link2site"
        When I follow "link"
        Then I should see "link2site"

    @should_fail
    Scenario: follow link fail
        Given I am on "click1.html"
        When I follow "link123"

    Scenario: click xpath
        Given I am on "click1.html"
        Then I should not see "link2site"
        When I click xpath "/html/body/ul/li[2]/a"
        Then I should see "link2site"

    @should_fail
    Scenario: click xpath fail
        Given I am on "click1.html"
        When I click xpath "/html/body/ul/li[5]/a"
