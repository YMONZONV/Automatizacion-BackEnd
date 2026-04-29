Feature: Buscar Usuario por ID
  Background:
  Como un administrador del sistema,
  Quiero poder gestionar los usuarios a través de la API,
  Para administrar la base de datos de usuarios.

    * url baseUrl

  @server1
  Scenario Outline: Buscar un usuario específico por su ID-Status 200
    Given path '/usuarios/<P_Id>'
    * def expected_response = read('classpath:data/Response/Get_Id/<G_jsonResponse>')
    * print 'responseEsperado: ', expected_response
    When method get
    * print 'response: ', response
    Then status 200
    And match response contains expected_response
    Examples:
      | read ('classpath:data/Request/Get_Id/get_id_usuarios.csv') |

  @server2
  Scenario Outline: 2.buscar un usuario específico por su ID-Status 400
    Given path '/usuarios/<P_Id>'
    * def expected_response = read('classpath:data/Response/Get_Id/<G_jsonResponse>')
    * print 'responseEsperado: ', expected_response
    When method get
    * print 'response: ', response
    Then status 400
    And match response contains expected_response
    Examples:
      | read ('classpath:data/Request/Get_Id/get_id_usuarios_neg.csv') |