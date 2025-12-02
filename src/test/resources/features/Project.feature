@Projects
Feature: Clockify Projects by Workspace

  Background:
    Given base url https://api.clockify.me/api
    And header x-api-key = Mzc2NTU1NTAtYzhmNi00NWVmLWI5Y2MtMDgyYmNlOGVlYThm

  @GetAllProjects
  Scenario: Get all projects by Workspace
    Given call Workspace.feature@GetAllWorkspaces
    And endpoint /v1/workspaces/{{idWorkspace}}/projects
    When execute method GET
    Then the status code should be 200
    * define idProject = $[0].id
    * print response


  @AddProject
  Scenario: Add new project

    Given call Workspace.feature@GetAllWorkspaces
    And endpoint /v1/workspaces/{{idWorkspace}}/projects
    And header Content-Type = application/json
    And set value "Software 2" of key name in body jsons/bodies/addNewProject.json
    When execute method POST
    Then the status code should be 201
    * print response


  @GetProjectInfo
  Scenario: Get a project info by name

    Given call Project.feature@GetAllProjects
    And endpoint /v1/workspaces/{{idWorkspace}}/{{idProject}}
    When execute method GET
    And response should be name = Software 2
    Then the status code should be 200
    * print response