# medical_device_classifier

This app is used to classify a medical device. It is an implementation of the classification rules 
according to MDR Annex VIII (EU 2017/745) agreed by the European Parliament and the Council of the 
European Union on 5 April 2017.

## Introduction and Goals
Annex VIII of the Medical Device Regulation (MDR) describes rules for a classification process of 
medical devices. The aim is to transfer these rules into an application for training purposes, 
which users can use to classify easily their medical device. The final application will be available 
online as a web page and as an application in the Android Play Store or Apple's App Store.

### Requirements Overview
#### R1  Medical device classification
As a medical device manufacturer I would like to know which classification my product has in order 
to know which measures must be taken. 

- [ ] The application determines the correct classification based on the algorithm described in Annex 
    VIII MDR 
- [ ] The application is reachable via a web site and via the app stores of Android and Apple
- [ ] The application is available in English, German and French language
- [ ] The application allows the user to change a previous made decision

#### R2 Definitions specific to classification rules
As a medical device manufacturer, I would like to understand the Annex VIII MDR specific terms to 
make correct decisions during the classification process.

- [ ] The user can search for specific term within a glossary
- [ ] The Annex VIII MDR specific terms are available

#### R3 Reference to the app stores
As responsible of the Medical Device Classifier I would like to have references on the web site to 
the app stores in order to animate the users to download the app.

- [ ] The web site contains a reference to the App Store of Apple
- [ ] The web site contains a reference to the Play Store of Android


### Quality Goals
| Goal          | Description                                                                |
|---------------|----------------------------------------------------------------------------|
| Reliability   | The algorithm for classifying a medical device must function without error |
| Usability     | 1. The application is intuitively to understand by professional users      | 
|               | 2. The application has an attractive UI design                             | 
| Extensibility | The application can be easily extended for new features                    |    


### Stakeholders
| Role                     | Name       | Contact                                                       | Expectation                                                               |
|--------------------------|------------|---------------------------------------------------------------|---------------------------------------------------------------------------|
| Project Owner, Developer | DeeKaySxb  | https://www.meetup.com/de-DE/strasbourg-flutter-meetup-group/ | Requirements, Documentation, Conceptual Planning, Development, Deployment |
| Developer                | Fabrice-64 | https://www.meetup.com/de-DE/strasbourg-flutter-meetup-group/ |                                                                           |                                                                          |                                                                           |

## Architecture Constraints
- Flutter framework has to be used
- go_router pub for navigation
- getIt pub for dependency injection
- cubits for state management

## System Scope and Context
### Business Context
### Technical Context
## Design
## Solution Strategy
## C4 Model
### System Context diagram
### Container (App) diagram
### Component diagram
### Building Block View
## Cross-cutting Concepts
## Architecture Decisions
## Conventions
### Coding Conventions
### Definition of Ready
### Definition of Done
## Quality Requirements
## Risks and Technical Debts
## Glossary
