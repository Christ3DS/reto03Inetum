Feature: Crear usuario reusable

  Scenario:

    * def username = 'qauser' + java.lang.System.currentTimeMillis()

    #reutiliza el json y settea el username dinámico
    * def requestBody = read('classpath:request/user/postUser.json')
    * set requestBody.username = username

    Given url baseUrl
    And path 'user'
    And request requestBody
    When method POST
    Then status 200
    * def createdUser = username