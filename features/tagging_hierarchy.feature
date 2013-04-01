Feature: Tag Hierarchy
  In order to use tag hierarchy
  As an admin
  I want to make tags become children of other tags

  Background:
    Given the following tags exist:
    | Nature             |
    | Insects            |
    | Odonata            |
    | Dragonflies        |
    | Damselflies        |
    | Landscapes         |
    | England            |
    | Greater Manchester |
    | City Centre        |
    | Salford Quays      |
    | Scotland           |
    | Glen Coe           |
    | Isle of Skye       |

    Given the following photos exist:
    | Wiltshire Sunrise.jpg      |
    | Bird.jpg                   |
    | Bird-bw.jpg                |
    | Devon Beach.jpg            |
    | Devon Beach-bw.jpg         |
    | BBC Media Centre.jpg       |
    | Manchester City Lights.jpg |
    | Picadilly Gardens.jpg      |
    | Damsefly.jpg               |
    | Two Dragonflies.jpg        |
    | Dragonfly.jpg              |
    
  Scenario: Establishing tag hierarchy
    When I put tag "Insects" as a child of "Nature"
    Then Tag "Insects" should have "Nature" as the parent
    And Tag "Nature" should have "Insects" as one of it's children
    
  Scenario: Setting self as parent
    When I try "Insects" to be parent of itself the object should not be valid
