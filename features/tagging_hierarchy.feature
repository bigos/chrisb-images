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
    When I try "Insects" as parent of itself it should not be valid

  Scenario: Tagging Manchester Photos
    When I put tag "Greater Manchester" as a child of "England"
    And I put tag "City Centre" as a child of "Greater Manchester"
    And I put tag "Salford Quays" as a child of "Greater Manchester"
    And I tag "BBC Media Centre.jpg" as "Salford Quays"
    And I tag "Piccadilly Gardens" as "City Centre"
    And I tag "Manchester City Lights.jpg" as "City Centre"
    Then following photos should be tagged as:
    | filename               | tag                |
    | Piccadilly Gardens.jpg | City Centre        |
    | Piccadilly Gardens.jpg | Greater Manchester |
    | Piccadilly Gardens.jpg | England            |
    And tag "England" should have "3" recursive photos
    And tag "Greater Manchester" should have "3" recursive photos
    And tag "City Centre" should have "2" recursive photos
    And tag "Salford Quays" should have "1" recursive photos 

  Scenario: Untagging Manchester Photos
    When I put tag "Greater Manchester" as a child of "England"
    And I put tag "City Centre" as a child of "Greater Manchester"
    And I put tag "Salford Quays" as a child of "Greater Manchester"
    And I tag "BBC Media Centre.jpg" as "Salford Quays"
    And I tag "Piccadilly Gardens" as "City Centre"
    And I tag "Manchester City Lights.jpg" as "City Centre"
    When I untag "England"
    Then tag "England" should have "0" recursive photos
    And tag "Greater Manchester" should have "0" recursive photos
    And tag "City Centre" should have "0" recursive photos
    And tag "Salford Quays" should have "0" recursive photos 
