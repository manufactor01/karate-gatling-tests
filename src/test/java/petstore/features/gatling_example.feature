Feature: Gatling example

  Background: Preconditions
    # --- setting user think time ---
    * def sleep = function(ms){ java.lang.Thread.sleep(ms) }
    * def pause = karate.get('__gatling.pause', sleep)
    # --- request & response ---
    * def req_create_user = read('../' + constants.create_user.request)
    * def res_create_user = read('../' + constants.create_user.response)
    * def res_get_user = read('../' + constants.get_user.response)
    * def req_update_user = read('../' + constants.update_user.request)
    * def res_delete_user = read('../' + constants.delete_user.response)

  Scenario: create and delete user
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
    * header karate-name = "create new user"
    Given url environment.apiUrl
    And path path_user
    And request req_create_user
    When method POST
    Then status 200
    And match response == res_create_user
    And match response.code == environment.userFlow.code
    And match response.type == environment.userFlow.type
    And match response.message == environment.userFlow.expectedId

    # --- setting pause ---
    * pause(5000)

    * header karate-name = "get user"
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

    # --- setting pause ---
    * pause(5000)

    * header karate-name = "delete user"
    * set res_delete_user.message = environment.userFlow.username
    Given url environment.apiUrl
    And path path_user, environment.userFlow.username
    When method DELETE
    Then status 200
    And match response == res_delete_user
    And match response.code == constants.code
    And match response.type == constants.type
    And match response.message == environment.userFlow.username

  Scenario: create and delete user using feeder
    * set req_create_user
      | path       | value                           |
      | id         | environment.userFlow.id         |
      | username   | __gatling.Username              |
      | firstName  | __gatling.FirstName             |
      | lastName   | __gatling.LastName              |
      | email      | __gatling.Email                 |
      | password   | __gatling.Password              |
      | phone      | __gatling.Phone                 |
      | userStatus | environment.userFlow.userStatus |
    * header karate-name = "create new user using data from feeder"
    Given url environment.apiUrl
    And path path_user
    And request req_create_user
    When method POST
    Then status 200
    And match response == res_create_user
    And match response.code == environment.userFlow.code
    And match response.type == environment.userFlow.type
    And match response.message == environment.userFlow.expectedId

    # --- setting pause ---
    * pause(5000)

    * header karate-name = "get user using USERNAME from feeder"
    Given url environment.apiUrl
    And path path_user, __gatling.Username
    When method GET
    Then status 200
    And match response == res_get_user
    And match response.id == environment.userFlow.id
    And match response.username == __gatling.Username
    And match response.firstName == __gatling.FirstName
    And match response.lastName == __gatling.LastName
    And match response.email == __gatling.Email
    And match response.password == __gatling.Password
    And match response.phone == __gatling.Phone
    And match response.userStatus == environment.userFlow.userStatus

    # --- setting pause ---
    * pause(5000)

    * header karate-name = "delete user using username from feeder"
    # * set res_delete_user.message = environment.userFlow.username

    Given url environment.apiUrl
    And path path_user, __gatling.Username
    When method DELETE
    Then status 200
    And match response == res_delete_user
    And match response.code == constants.code
    And match response.type == constants.type
    And match response.message == __gatling.Username