@Workspace
Feature: Clockify Workspace

  Background:
    Given base url https://api.clockify.me/api
    And header x-api-key = Mzc2NTU1NTAtYzhmNi00NWVmLWI5Y2MtMDgyYmNlOGVlYThm

  @GetAllWorkspaces
  Scenario: Get all my workspaces

    Given endpoint /v1/workspaces
    When execute method GET
    Then the status code should be 200
    * define idWorkspace = $[0].id


  @GetWorkspaceInfo
  Scenario: Get Workspace info

    Given call Workspace.feature@GetAllWorkspaces
    And endpoint /v1/workspaces/{{idWorkspace}}
    When execute method GET
    Then the status code should be 200
    * print response