Feature: Consultar usuario

  Background:
    * url baseUrl
    * path 'user'

  @contract
  @happy-path
  @headers
  @schema
  @data-types
  Scenario: Verificar la consulta exitosa de un usuario existente

    #Crear usuario antes de consultarlo
    * def createResponse = call read('classpath:functional/features/common/createUser.feature')
    * def username = createResponse.createdUser


    # Username a consultar
    Given path username

    # apiKey y header requerido
    And header api_key = apiKey
    And header X-Transaction-Id = transactionId

    When method GET
    Then status 200

    # Validar @schema
    And match response == read('classpath:schemas/user/getUserUsernameResponse.json')

    # Validar  @data-types
    And match response.id == '#number'
    And match response.username == '#string'
    And match response.email == '#string'
    And match response.userStatus == '#number'

  # Valida el contenido específico de los campos
  @contract
  @fields
  Scenario: Verificar contenido de campos del usuario

    # Crear usuario previo a la validación
    * def createResponse = call read('classpath:functional/features/common/createUser.feature')
    * def username = createResponse.createdUser

    Given path username
    When method GET
    Then status 200
    And match response.username == username
    And match response.firstName == '#string'
    And match response.lastName == '#string'


  #Escenario get usuario inexistente / valida que maneje correctamente el error 404
  @contract
  @error-handling
  @schema
  Scenario: Verificar consulta de usuario inexistente
    Given path 'usuarioNoExiste'
    When method GET
    Then status 404

    # schema
    And match response == read('classpath:schemas/user/errorResponse.json')


  #Escenario regresión get usuarios inexistentes / valida que maneje todos los usuarios inexistentes - 404
  @contract
  @boundary
  @regression
  @schema
  Scenario Outline: Verificar consulta de múltiples usuarios inexistentes
    Given path '<username>'
    When method GET
    Then status 404

    #schema
    And match response == read('classpath:schemas/user/errorResponse.json')

    Examples:
      | usuario        |
      | usu001         |
      | usu002         |
      | usu003         |
