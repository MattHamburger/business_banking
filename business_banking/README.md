# business_banking

A demo app to showcase the clean framework for a business banking app.

## Setting up your Mockoon environment

Following are the instructions for setting up your Mockoon routes for each screen.  
*Make sure your port is set to 3001.*  
Having these routes set correctly and having the Mockoon environment running during your tests is **essential** to these tests passing.  
Please keep this updated regarding the information you are testing against.  
For information on installing and setting up Mockoon, please see mockoon.md.  
A JSON export from Mockoon of the environment can be found in the mockoon folder.

### CashAccounts Screen

\| route | method | response |
\| --- | --- | --- |
\| /accounts | GET | 200 |

#### JSON
```json
{
  "type": "Employee Checking",
  "lastFour": "6542",
  "balance": 3545.54
}
```

### AccountDetail Screen

\| route | method | response |
\| --- | --- | --- |
\| /account-details | GET | 200 |

#### JSON
```json
{
  "name": "Employee Checking",
  "lastFour": "6542",
  "accountType": "Employee Checking",
  "routingNum": 746395735,
  "balance": 3545.54,
  "begBalance": 3674.43,
  "penTrans": -128.89,
  "depHolds": 0.00
}
```

## Getting Started

Commercial/Business app
-app with login and hello world landing page
-app in test flight and google beta
-ci/cd - validate, unit test, driver test, (maybe ui functional test, golden test), compile, upload to test flight and beta, send emails to testers
-unit tests, ideally 100% coverage - genhtml and locov

-uses clean framework - 

login - Shrey
hub (hello work displays) - loads after login - Maxwell
locations - loads from a small button on login screen - Ben 

For each feature, login, hello_landing and locations  
-create a screen, view model, presenter
-create tests so you have 100% coverage
-bloc
-create tests so you have 100% coverage
-use case
-create tests so you have 100% coverage
-repository
-create tests so you have 100% coverage
-service and service adaptor
