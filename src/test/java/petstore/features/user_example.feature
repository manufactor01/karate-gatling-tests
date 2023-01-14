@user @all
Feature: User

  Background: Preconditions
    * def req_create_user = read('../' + constants.create_user.request)
    * def res_create_user = read('../' + constants.create_user.response)
    * def res_get_user = read('../' + constants.get_user.response)
    * def req_update_user = read('../' + constants.update_user.request)
    * def res_delete_user = read('../' + constants.delete_user.response)

  Scenario: create user
    * set req_create_user
      | path       | value                           |
      | id         | environment.userFlow.id         |
      | username   | environment.userFlow.username   |
      | firstName  | environment.userFlow.firstName  |
      | lastName   | environment.userFlow.lastName   |
      | email      | environment.userFlow.email      |
      | password   | environment.userFlow.password   |
      | phone      | environment.userFlow.phone      |
      | userStatus | environment.userFlow.userStatus |
    Given url environment.apiUrl
    And path path_user
    And request req_create_user
    When method POST
    Then status 200
    And match response == res_create_user
    And match response.code == environment.userFlow.code
    And match response.type == environment.userFlow.type
    And match response.message == environment.userFlow.expectedId

  Scenario: get user by username
    Given url environment.apiUrl
    And path path_user,environment.userFlow.username
    When method GET
    Then status 200
    And match response == res_get_user
    And match response.id == environment.userFlow.id
    And match response.username == environment.userFlow.username
    And match response.firstName == environment.userFlow.firstName
    And match response.lastName == environment.userFlow.lastName
    And match response.email == environment.userFlow.email
    And match response.password == environment.userFlow.password
    And match response.phone == environment.userFlow.phone
    And match response.userStatus == environment.userFlow.userStatus

  Scenario: update user
    * set req_update_user
      | path       | value                              |
      | id         | environment.userFlow.newId         |
      | username   | environment.userFlow.newUsername   |
      | firstName  | environment.userFlow.newFirstName  |
      | lastName   | environment.userFlow.newLastName   |
      | email      | environment.userFlow.newEmail      |
      | password   | environment.userFlow.newPassword   |
      | phone      | environment.userFlow.newPhone      |
      | userStatus | environment.userFlow.newUserStatus |
    Given url environment.apiUrl
    And path path_user,environment.userFlow.username
    And request req_update_user
    When method PUT
    Then status 200
    And match response == res_create_user
    And match response.code == constants.code
    And match response.type == constants.type
    And match response.message == environment.userFlow.newExpectedId

  Scenario: delete user
    * set res_delete_user.message = environment.userFlow.newUsername
    Given url environment.apiUrl
    And path path_user, environment.userFlow.newUsername
    When method DELETE
    Then status 200
    And match response == res_delete_user
    And match response.code == constants.code
    And match response.type == constants.type
    And match response.message == environment.userFlow.newUsername
