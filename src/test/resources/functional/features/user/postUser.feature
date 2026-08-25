Feature: Crear usuario

  Background:
    * print baseUrl
    * url baseUrl
    * path 'user'

  @contract
  @smoke
  @happy-path
  @headers
  @schema
  Scenario: Verificar la creación exitosa de un usuario con datos válidos

    #usuario único
    * def username = 'qauser' + java.lang.System.currentTimeMillis()

    #carga payload desde el json
    * def requestBody = read('classpath:request/user/postUser.json')

    #reemplazar usuario dinámico
    * set requestBody.username = username

    # apiKey y header requerido
    And header api_key = apiKey
    Given header X-Transaction-Id = transactionId

    #envia payload
    And request requestBody

    #ejecuta la petición
    When method POST

    #valida status code
    Then status 200

    #valida response
    And match response == read('classpath:schemas/user/postUserResponse.json')

