Feature: Forms
    Scenario: Single Fill
        Given I am on "form.html"
        Then "Timo" should be contained in field "developer"
        When I fill in "Johnny" for "developer"
        Then "Johnny" should be contained in field "developer"

    @should_fail
    Scenario: Single Fill fail
        Given I am on "form.html"
        Then "Timo" should be contained in field "developer"
        When I fill in "Peter" for "developer"
        Then "Johnny" should be contained in field "developer"

    Scenario: Single Fill Exactly
        Given I am on "form.html"
        When I fill in "Johnny Timo" for "developer"
        Then "Johnny" should not be equal to field "developer"
        Then "Johnny Timo" should be equal to field "developer"

    @should_fail
    Scenario: Single Fill Exactly Fail
        Given I am on "form.html"
        When I fill in "Johnny Timo" for "developer"
        Then "Johnny" should be equal to field "developer"

    Scenario: Multi
        Given I am on "form.html"
        Then "Alex" should be contained in field "manager"
        Then "Timo" should be contained in field "developer"
        When I fill in the following:
            | developer | Alex   |
            | manager   | Johnny |
        Then "Johnny" should be contained in field "manager"
        Then "Alex" should be contained in field "developer"

    @should_fail
    Scenario: Multi fail
        Given I am on "form.html"
        When I fill in the following:
            | developer_fail | Alex   |
            | manager_fail   | Johnny |

    Scenario: Select
        Given I am on "form.html"
        Then "value2" should be contained in field "selection"
        When I select "Value 1" from "selection"
        Then "value1" should be contained in field "selection"

    @should_fail
    Scenario: Select
        Given I am on "form.html"
        When I select "Value 3" from "selection"
        Then "value1" should be contained in field "selection"

    Scenario: Checkbox
        Given I am on "form.html"
        Then should not be checked "validation"
        When I check "validation"
        Then should be checked "validation"

    @should_fail
    Scenario: Checkbox fail
        Given I am on "form.html"
        When I check "validation_fail"

    Scenario: Uncheck
        Given I am on "form.html"
        Then should not be checked "validation"
        When I check "validation"
        Then should be checked "validation"
        When I uncheck "validation"
        Then should not be checked "validation"

    @should_fail
    Scenario: Uncheck fail
        Given I am on "form.html"
        When I check "validation"
        When I uncheck "validation2"

    Scenario: Radio
        Given I am on "form.html"
        When I choose "radio1"
        Then should be checked "radio1"
        Then should not be checked "radio2"
        When I choose "radio2"
        Then should be checked "radio2"
        Then should not be checked "radio1"

    @should_fail
    Scenario: Radio fail
        Given I am on "form.html"
        When I choose "radio1"
        Then should be checked "radio2"

    Scenario: File
        Given I am on "form.html"
        When I attach the file "features/htdocs/form.html" to "file1"
        Then "C:\fakepath\form.html" should be equal to field "file1"

    @should_fail
    Scenario: File fail
        Given I am on "form.html"
        When I attach the file "features/htdocs/form.htm" to "file1"

    Scenario: Blurer
        Given I am on "form.html"
        Then "before" should be contained in field "blurer"
        When I leave the field "blurer"
        Then "after" should be contained in field "blurer"

    @should_fail
    Scenario: Blurer fail
        Given I am on "form.html"
        When I leave the field "radio1"
        Then "after" should be contained in field "blurer"

    Scenario: Submit
        Given I am on "form.html"
        When I submit form "f1"
        When I wait for 1 second
        Then I should have the following query string:
            | developer | Timo   |
            | manager   | Alex   |
            | selection | value2 |

    @should_fail
    Scenario: Submit fail
        Given I am on "form.html"
        When I choose "radio1"
        When I submit form "f1"
        When I wait for 1 second
        Then I should have the following query string:
            | developer | Timo   |
            | manager   | Alex   |
            | selection | value2 |
