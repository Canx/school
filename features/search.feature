Feature: search
  Scenario: find school by partial name
    Given there are the following school profiles:
      | school_name    |
      | IES La Vereda  |
      | IES Benicalap  |
      | CEIP Jaime I   |
    When I search for "IES"
    Then the results should be:
      | school_name    |
      | IES La Vereda  |
      | IES Benicalap  |
