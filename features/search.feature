Feature: search
  Background:
    Given there are the following levels:
      | name           |
      | Primaria       |
      | Secundaria     |
      | Bachiller      |
    Given there are the following school profiles:
      | name           | city              | levels                |
      | IES La Vereda  | Burjassot         | Secundaria,Bachiller  |
      | IES Benicalap  | Valencia          | Secundaria            |
      | CEIP XXXXXXX   | Valencia          | Primaria              |
      | CEIP Jaime I   | Peñíscola         | Primaria              |
      | IES Benicarlo  | Benicarlo         | Secundaria            |
      | IES Benicassim | Benicassim        | Secundaria            |

  Scenario: search schools by city
    When I search for schools in "Valencia" 
    Then the results should be:
      | level          | total |
      | Primaria       |     1 |
      | Secundaria     |     1 |

  Scenario: results found are from diferent cities
    When I search for schools in "Beni"
    Then the results should be:
      | name           | count |
      | Benicarlo      |     1 |
      | Benicassim     |     1 |

  Scenario: results from diferent cities should link to cities results
    When I search for schools in "Beni" 
    And I click on "Benicarlo" city
    Then the results should be:
      | level          | total |
      | Secundaria     |     1 |
