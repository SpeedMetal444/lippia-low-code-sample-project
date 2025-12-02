@Clients
  Feature: Clockify Clients

    Background:
      Given base url https://api.clockify.me/api
      And header x-api-key = Mzc2NTU1NTAtYzhmNi00NWVmLWI5Y2MtMDgyYmNlOGVlYThm

    @GetClientsInfo
    Scenario: Get all clients

      Given call Workspace.feature@GetAllWorkspaces
      And endpoint /v1/workspaces/{{idWorkspace}}/clients
      When execute method GET
      Then the status code should be 200
      * print response

    @AddClient
    Scenario: Add new client

      Given call Client.feature@GetClientsInfo
      And endpoint /v1/workspaces/{{idWorkspace}}/clients
      And header Content-Type = application/json
      And set value "clientAutomat" of key name in body jsons/bodies/addNewClient.json
      When execute method POST
      Then the status code should be 201
      * define idClient = $.id
      * print response

    @DeleteClient
    Scenario: Delete client
      Given call Client.feature@GetClientsInfo
      And endpoint /v1/workspaces/{{idWorkspace}}/{{idClient}}/
      And response should be name = clientAutomat
      And execute method DELETE
      Then the status code should be 200
      * print response

    @GetAClientInfo
    Scenario: Get client info
      Given call Client.feature@GetClientsInfo
      And endpoint /v1/workspaces/{{idWorkspace}}/clients/6928f5ed96220f42b645b890
      And execute method GET
      Then the status code should be 200
      * print response