@mongodb
Feature: Bootstrap a MongoDB server using Chef.

  Background:
    * I have a server called "mongodb"
    * "mongodb" is running "ubuntu" "precise"
    * "mongodb" has "amd64" architecture
    * "mongodb" has been provisioned
    * the following roles have been updated:
      | role | role_path |
      | mongodb | ./support/roles/ |
    * the "chef-client::service" recipe has been added to the "mongodb" run list
    * the "mongodb" recipe has been added to the "mongodb" run list
    * the chef-client has been run on "mongodb"
    * I ssh to "mongodb" with the following credentials:
      | username | keyfile |
      | root | ../.ssh/id_rsa |

    Scenario: MongoDB is running and bound to 0.0.0.0
        When I run "ps xa | grep mongod"
        Then I should see "/usr/bin/mongod" in the output
        And I should see "--bind_ip 0.0.0.0" in the output
        And I should not see "--config /etc/mongodb.conf" in the output
