Feature: search
  Scenario: search schools by partial name
    Given there are the following school profiles:
      | name           |
      | IES La Vereda  |
      | IES Benicalap  |
      | CEIP Jaime I   |
    When I search for schools with "IES" in its name
    Then the results should be:
      | name           |
      | IES La Vereda  |
      | IES Benicalap  |

  Scenario: search schools by city
    Given there are the following school profiles:
      | name           | city              |
      | IES La Vereda  | Pobla de Vallbona |
      | IES Benicalap  | Valencia          |
      | CEIP Jaime I   | Peñíscola         |
    When I search for schools in "Peñíscola" city
    Then the results should be:
      | name           |
      | CEIP Jaime I   |
