Feature: search
  Background:
    Given there are the following levels:
      | name           |
      | Secundaria     |
      | Bachiller      |
      | Primaria       |
    Given there are the following school profiles:
      | name           | city              | levels                |
      | IES La Vereda  | pobla de vallbona | Secundaria,Bachiller  |
      | IES Benicalap  | Valencia          | Secundaria            |
      | CEIP XXXXXXX   | Valencia          | Primaria              |
      | CEIP Jaime I   | Peñíscola         | Primaria              |

  Scenario: search schools by city and level
    When I search for schools in "Valencia" and level "Secundaria"
    Then the results should be:
      | name           |
      | IES Benicalap  |
