@pet @all
Feature: Pet

  Background: Preconditions
    * def req_create_pet = read('../' + constants.create_pet.request)
    * def res_create_pet = read('../' + constants.create_pet.response)
    * def res_get_pet = read('../' + constants.get_pet.response)
    * def res_delete_pet = read('../' + constants.delete_pet.response)

  Scenario: create pet
    * set req_create_pet
      | path          | value                            |
      | id            | environment.petFlow.id           |
      | name          | environment.petFlow.name         |
      | status        | environment.petFlow.status       |
      | category.id   | environment.petFlow.categoryId   |
      | category.name | environment.petFlow.categoryName |
    Given url environment.apiUrl
    And path path_pet
    And request req_create_pet
    When method POST
    Then status 200
    And match response == res_create_pet
    And match response.id == environment.petFlow.id
    And match response.category.id == environment.petFlow.categoryId
    And match response.category.name == environment.petFlow.categoryName
    And match response.name == environment.petFlow.name
    And match response.status == environment.petFlow.status

  Scenario: get pet by ID
    Given url environment.apiUrl
    And path path_pet, environment.petFlow.id
    When method GET
    Then status 200
    And match response == res_get_pet
    And match response.id == environment.petFlow.id
    And match response.category.id == environment.petFlow.categoryId
    And match response.category.name == environment.petFlow.categoryName
    And match response.name == environment.petFlow.name
    And match response.status == environment.petFlow.status

  Scenario: delete pet by ID
    Given url environment.apiUrl
    And path path_pet, environment.petFlow.id
    When method DELETE
    Then status 200
    And match response == res_delete_pet
    And match response.code == constants.code
    And match response.type == constants.type
    And match response.message == environment.petFlow.expectedId