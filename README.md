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
### Git Workflow

In order to collaborate within this project we will use the Gitflow workflow. 

#### Develop and main branches
![alt text](https://wac-cdn.atlassian.com/dam/jcr:a13c18d6-94f3-4fc4-84fb-2b8f1b2fd339/01%20How%20it%20works.svg?cdnVersion=1240)

- The main branch contains the official release history
- The develop branch is an integration branch for features
- All commits into the main branch gets tagged with a version number
- To merge the develop branch to the main branch requires always a pull request and an approval


#### Feature branches
![alt text](https://wac-cdn.atlassian.com/dam/jcr:34c86360-8dea-4be4-92f7-6597d4d5bfae/02%20Feature%20branches.svg?cdnVersion=1240)

- Each new feature gets an own branch
- The feature branch is always branched off from develop
- The feature branch is always merged to develop
- To merge the feature branch to the develop branch requires always a pull request, code review and an approval

#### Release branches
![alt text](https://wac-cdn.atlassian.com/dam/jcr:8f00f1a4-ef2d-498a-a2c6-8020bb97902f/03%20Release%20branches.svg?cdnVersion=1240)

- A release branch is always a fork of the current develop branch
- No new features are allowed to add to the release branch
- Bug fixes, documentation and release oriented tasks are allowed to commit
- When the release branch is ready, it gets merged into the main branch and tagged with a version number
- Additionally, the release branch gets merged into develop
- After merging the release branch into main and develop, the release branch gets deleted
- A feature branch is named like following: feature/<name of feature_branch>

#### Hotfix branches
![alt text](https://wac-cdn.atlassian.com/dam/jcr:cc0b526e-adb7-4d45-874e-9bcea9898b4a/04%20Hotfix%20branches.svg?cdnVersion=1240)
- Hotfix branches are used to quickly patch production releases
- Hotfix branches bases on the main branch
- If a bug it fixed it should be merged into the main and develop branch
- The main branch should be tagged with a new version
- A hotfix branch is named like following: hotfix/<name of hotfix_branch>

#### Additional: Private branches
If you are currently coding and you have to interrupt for a break or end of work then commit your 
current work into a private branch. 

- A private branch branches off from your current feature branch
- A private branch merges into your current feature branch
- When merging from private branch to feature branch then squash all commits by using a single commit message
- A private branch is named like following: private/<your initials>_<name of feature_branch>

#### Structure of a commit message

<type>:<subject> 

<body>

**Types**

- feat: (new feature for the user, not a new feature for build script)
- fix: (bug fix for the user, not a fix to a build script)
- docs: (changes to the documentation)
- style: (formatting, missing semi colons, etc; no production code change)
- refactor: (refactoring production code, e. g. renaming a variable)
- test: (adding missing tests, refactoring tests; no production code change)
- chore: (updating grunt tasks etc; no production code change)
- ci: (updating the ci configuration, e. g. .gitlab-ci.yml)

**Subject**
- Maximal 50 characters long
- Only the first letter is capitalized
- Don't put a period at the end of the subject line
- Put a blank between subject and body
- Use imperative mood

**Body**
- Wrap lines at 72 characters
- Use imperative mood
- Explain only what and why
- Optional: can contain the specific ticket number for a work in following way [<ticket number>]

**Example**

git commit -v -m "feat: Create the Cart Feature with a Nice Animation

Enhanced the CSS layout of the cart section, addressing text
alignment issues and refining the layout for improved aesthetics
and readability [TN-123].
"

Sources: 

https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow
https://www.conventionalcommits.org/en/v1.0.0/
https://medium.com/gitconnected/good-commit-vs-your-commit-how-to-write-a-perfect-git-commit-message-6e96ab6357fa

### Definition of Ready
### Definition of Done
## Quality Requirements
## Risks and Technical Debts
## Glossary
