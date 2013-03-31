Feature: Image Tagging Feature
  In order to tag images
  As the admin
  I want to tag images

  Background:
    Given the following tags exist:
    | nature       |
    | landscapes   |
    | misspelt tag |

    Given the following photos exist:
    | sunrise.jpg     |
    | bird.jpg        |
    | bird-bw.jpg     |
    | city_lights.jpg |
    | beach.jpg       |
    | beach-bw.jpg    |
        
    Scenario: Successful tagging
      When I tag "bird.jpg" as "nature"
      Then  the photo "bird.jpg" should include tag "nature"
      And tag count of photo "bird.jpg" should be "1"

    Scenario: Adding new tag
      When I tag "bird-bw.jpg" as "black and white"
      Then  the photo "bird-bw.jpg" should include tag "black and white"
      And tag count should be "4"
      
    Scenario: Removing a tag
      When I tag "bird.jpg" as "nature"
      Then  the photo "bird.jpg" should include tag "nature"
      And tag count of photo "bird.jpg" should be "1"
      When I remove tag "nature" from photo "bird.jpg"
      Then tag count of photo "bird.jpg" should be "0"
      And total tag count should be "3"
