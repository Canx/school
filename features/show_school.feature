Feature: Show school
  In order to evaluate a school
  As a student
  I want to review detailed info about the school

  Background:
    Given there are the following levels:
      | name          |
      | Secundaria    |
      | Bachiller     |
    Given there are the following school profiles:
      | name          | city              | levels               |
      | IES La Vereda | Pobla de Vallbona | Secundaria,Bachiller |

  Scenario: Show school
    When I go to the show page for that school
    Then I should see its name, city and levels
