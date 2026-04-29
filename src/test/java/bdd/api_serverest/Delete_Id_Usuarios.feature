Feature: Excluir Usuario

  Background:
  Como un administrador del sistema,
  Quiero poder gestionar los usuarios a través de la API,
  Para administrar la base de datos de usuarios.

    * url baseUrl

  @server4
  Scenario Outline: 1.actualizar la información de un usuario existente-Status 200-201-400
    Given path '/usuarios/<P_Id>'
    * def expected_response = read('classpath:data/Response/Delete/<D_jsonResponse>')
    * print 'responseEsperado: ', expected_response
    When method delete
    * print 'response: ', response
    Then status 200
    And match response == expected_response
    Examples:
      | read ('classpath:data/Request/Delete/delete_usuarios.csv') |