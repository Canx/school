Feature: search
  Scenario: find school by partial name
    Given there are the following school profiles:
      | IES La Vereda  |
      | IES Benicalap  |
      | CEIP Jaime I   |
    When I search for "IES"
    Then the results should be:
      | IES La Vereda  |
      | IES Benicalap  |
