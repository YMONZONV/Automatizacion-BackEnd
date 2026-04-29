@GetUsuarios
Feature: Listar Usuarios
  Background:
  Como un administrador del sistema,
  Quiero poder gestionar los usuarios a través de la API,
  Para administrar la base de datos de usuarios.

    * url baseUrl

  Scenario Outline: 1.Obtener una lista de todos los usuarios
    Given path '/usuarios'
    * def params_body = read('classpath:data/Request/<P_jsonParams>')
    And params params_body
    * print 'params: ', params_body
    * def expected_response = read('classpath:data/Response/<U_jsonResponse>')
    * print 'responseEsperado: ', expected_response
    When method get
    * print 'response: ', response
    Then status 200
    And match response contains deep expected_response
    Examples:
      | read ('classpath:data/Request/get_usuarios.csv') |