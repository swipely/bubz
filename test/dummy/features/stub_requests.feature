Feature: Stub requests

  In order to write front-end step definitions before the back-end is in place
  As a front-end web developer
  I wish to stub the back-end's response for certain requests

  Scenario: Non-stubbed request
    When I request a page
    Then I should see its actual response

  Scenario: Stubbed request
    Given the backend stubs "/pages/stubme" with
      """
      { "foo": "bar" }
      """
    When I request the stubbed page
    Then I should see the stubbed response
    When I request a non-stubbed page
    Then I should see its actual response

