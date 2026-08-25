Feature: Eliminar usuario

  Background:
    * url baseUrl
    * path 'user'

  @contract
  @happy-path
  @headers
  Scenario: Verificar la eliminación exitosa de un usuario

    * def createResponse = call read('classpath:functional/features/common/createUser.feature')
    * def username = createResponse.createdUser

    # usuario existente a eliminar
    Given path username

    # apiKey y header requerido
    And header api_key = apiKey
    And header X-Transaction-Id = transactionId

    When method DELETE
    Then status 200


    #validar eliminación
    Given path username
    When method GET
    Then status 404

    # Validar contrato de error
    # And match response == read('classpath:schemas/user/errorResponse.json')
    # And match response/apiResponse/type == 'unknown'
    # And match response contains 'unknown'
    # And match response.apiResponse.message contains username