@PostUsuarios
Feature: Registrar Usuarios
  Background:
  Como un administrador del sistema,
  Quiero poder gestionar los usuarios a través de la API,
  Para administrar la base de datos de usuarios.

    * url baseUrl
  @PostUsuariosOK
  Scenario Outline: 1.Registrar un nuevo usuario con datos válidos-Status 201
    Given path '/usuarios'
    * def request_body = read('classpath:data/Request/Post/<Po_jsonRequest>')
    And request request_body
    * print 'request: ', request_body
    * def expected_response = read('classpath:data/Response/Post/<Po_jsonResponse>')
    * print 'responseEsperado: ', expected_response
    When method post
    * print 'response: ', response
    Then status 201
    And match response contains expected_response
    Examples:
      | read ('classpath:data/Request/Post/post_usuarios.csv') |

  @PostUsuariosNeg
  Scenario Outline: 2.Registrar un  usuario con datos usados-Status 400
    Given url "https://serverest.dev/usuarios"
    * def request_body = read('classpath:data/Request/Post/<Po_jsonRequest>')
    And request request_body
    * print 'request: ', request_body
    * def expected_response = read('classpath:data/Response/Post/<Npo_jsonResponse>')
    * print 'responseEsperado: ', expected_response
    When method post
    * print 'response: ', response
    Then status 400
    And match response contains expected_response
    Examples:
      | read ('classpath:data/Request/Post/post_usuarios_neg.csv') |