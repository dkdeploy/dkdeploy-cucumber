Feature: URLs

    Scenario: I am on existing page
        Given I am on "url.html"
        Then I should be on "/url.html"

    @should_fail
    Scenario: I should be on fail
        Given I am on "url.html"
        Then I should be on "/url2.html"

    @should_fail
    Scenario: I am on fail
        Given I am on "not_exists.html"

    Scenario: Query String
        Given I am on "url.html?test=abbrev&again=abnormally"
        Then I should be on "/url.html"
        Then I should have the following query string:
            | test  | abbrev     |
            | again | abnormally |

    @should_fail
    Scenario: Query String fail
        Given I am on "url.html?test=abbrev&again=abnormally"
        Then I should have the following query string:
            | test  | abbrev3     |
            | again | abnormally3 |
