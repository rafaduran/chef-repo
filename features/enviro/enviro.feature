@enviro
Feature: Enviro cookbook performing common tasks
  In order to perform all common taks in just one place
  As an infrastructure developer
  I want an enviro cookbook that performs all common tasks for all my nodes

  Background:
    * I have a server called "enviro"
    * "enviro" is running "ubuntu" "precise"
    * "enviro" has been provisioned
    * the "chef-client::service" recipe has been added to the "enviro" run list
    * the "enviro" recipe has been added to the "enviro" run list
    * the chef-client has been run on "enviro"
    * I ssh to "enviro" with the following credentials:
      | username | keyfile |
      | root | ../.ssh/id_rsa |

  Scenario: Enviro Cookbooks minitest pass
    When I enable the running of MiniTest suites for "enviro"
    Then the tests should run and pass on "enviro"
