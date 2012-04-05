Feature: search
  Scenario: find school by partial name
    Given a user has created the following school profiles:
      | content        |
      | IES La Vereda  |
      | IES Benicalap  |
      | CEIP Jaime I   |
    When I search for "IES"
    Then the results should be:
      | content        |
      | IES La Vereda  |
      | IES Benicalap  |
