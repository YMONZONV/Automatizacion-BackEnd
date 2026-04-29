Feature: Editar Usuario
  Background:
  Como un administrador del sistema,
  Quiero poder gestionar los usuarios a través de la API,
  Para administrar la base de datos de usuarios.

    * url baseUrl

  @server3
  Scenario Outline: 1.actualizar la información de un usuario existente-Status 200-201-400
    Given path '/usuarios/<P_Id>'
    * def request_body = read('classpath:data/Request/Put/<P_jsonRequest>')
    And request request_body
    * print 'request: ', request_body
    * def expected_response = read('classpath:data/Response/Put/<P_jsonResponse>')
    * print 'responseEsperado: ', expected_response
    When method put
    * print 'response: ', response
    Then status <code>
    And match response contains deep expected_response
    Examples:
      | read ('classpath:data/Request/Put/put_usuarios.csv') |