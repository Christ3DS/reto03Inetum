Feature: Actualizar usuario

  Background:
    * url baseUrl
    * path 'user'

  @contract
  @happy-path
  @headers
  @schema
  Scenario: Verificar la actualización exitosa de un usuario

    # Crear usuario antes de actualizar
    * def createResponse = call read('classpath:functional/features/common/createUser.feature')
    * def username = createResponse.createdUser

    # cargar payload
    * def requestBody = read('classpath:request/user/putUserUsername.json')
    * set requestBody.username = username

    # Usuario existente a actualizar
    Given path username

    # Header requerido
    And header X-Transaction-Id = transactionId
    And request requestBody
    When method PUT
    Then status 200
    # Schema
    And match response == read('classpath:schemas/user/putUserUsernameResponse.json')