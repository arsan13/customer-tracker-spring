# Customer Tracker

Customer Tracker application uses **Maven** for project dependency management and the entire application is developed using **Spring MVC** with pure java (no xml) configuration. This application leverages the power of **Spring Security** for providing  authentication and role based authorization as well.

## Requirements :
* Java 8 or higher
* Apache Tomcat
* MySQL database
* IDE

## Instructions :
1. Download and import the code.
2. Run the database scripts provied within the project.

## Spring Security
As mentioned earlier, spring security not only provides authentication, but also authorisation based on roles.<br>
We restrict users and display contents based on roles.<br>
* **Employee role :** users in this role will only be allowed to list customers.
* **Manager role:** users in this role will be allowed to list, add and update customers.
* **Admin role :** users in this role will be allowed to list, add, update and delete customers.

1. Arthur
    * username : arthur
    * password : test123
    * Role : employee
2. Polly
    * username : polly
    * password : test123
    * Role : employee, manager
3. Thomas
    * username : thomas
    * password : test123
    * Role : employee, admin
