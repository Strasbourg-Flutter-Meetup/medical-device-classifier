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
- [ ] Before the user starts the classification, he has to confirm the he knows the specific definitions regarding to the classification
- [ ] Before the user starts the classification, he has to confirm the he knows the implementing rules regarding to the classification
- [ ] Before the user starts the classification, he has to confirm that the device is a medical device
- [ ] The implementing rule 3.5 is covered by the algorithm 

#### R2 Definitions specific to classification rules
As a medical device manufacturer, I would like to understand the Annex VIII MDR specific terms to 
make correct decisions during the classification process.

- [ ] The user can search for specific term within a glossary
- [ ] The Annex VIII MDR specific definitions are available
- [ ] The MDCG 2021-24 definitions are available
- [ ] The user can read the definitions before he starts the classifier
- [ ] The user can read the definitions during the classification process


#### R3 Implementing rules
As application provider, I would like that the user has the chance to read the implementing rules in order to
ensure that the user is able to make correct decisions during the classification process. 

- [ ] The user can read the implementing rules before he starts the classifier
- [ ] The user can read the implementing rules during the classification process

#### R4 Reference to the app stores
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
### View flow
![View flow](resources/visual_design/a_view_flow_chart.jpg)

#### Dashboard
The dashboard is the first screen, which the user will see. It offers some general information about 
the purpose of this application and allows the user to navigate to each feature.

#### Definitions 
The definition view exists to provide the user MDR VIII and MDCG 2021-24 specific definitions in order 
to allow the user to gain understandings about the used terms. Furthermore a separated Defintions view
can be easily accessed from anywhere within the application, which will satisfy some specific requirements 
in **R2 Definitions specific to classification rules**. 

#### Implementing Rules
The implementing rule view exists to provide the user MDR III specific impelementation rules in order 
to allow  the user to use the classifier correctly. Furthermore a separated Implementing Rules view
can be easily accessed from anywhere within the application, which will satisfy some specific requirements
in **R3 Implementing rules**.

#### Data Protection
Contains a standard data protection statement. Especially that we have to mention our hoster and that we 
have a GDPR order processing agreement. We also have to mention their data protection and if they collect 
any data (e. g. IP addresses) we have to mention that. 

#### Legal Notice

Not sure if we really require that, because the website and the application is private.

Nevertheless I mentioned some information, which should be published.

- The identity of the entrepreneur and the name of the company’s corporate name;
- The contact details of the company’s head office;
- A contact email address and a telephone number;
- The registration number in the Trade and Companies Register (RCS) or the Trade Register (RM);
- The intra-community VAT number;
- References to the professional rules applicable and to the professional title in the context of a regulated profession;
- The contact details of the site host (identity, address, telephone number of the host);
- The General Terms and Conditions of Sale (GTC);
- The Declaration number of the french Commission Nationale Informatique et des Libertés (CNIL);
- The law applicable in the event of a dispute;
- A disclaimer of liability clause;
- The use of cookies and tracking devices (allowing the collection of personal data);
- Information on your partnerships (affiliation service);
- Allow people who register on your site using their contact information to contact you to change or delete this information

[Source](https://www.bonnefous.com/en/blog/what-are-the-mandatory-legal-notices-on-the-internet-in-france/)

#### About Us

At the About Us view we will describe the Strasbourg Flutter Meetup Group and the motivation why we
developed this classifier.

#### Classifier Introduction

Allows a deeper explanation of the classifier and to make sure that the user is aware of the specific
definitions, implementing rules and the status of its device. The user shall proof that, by confirming
the understanding of the definitions, implementing rules and the status of its device. 

#### Classifier

The classifier view allows the user classify its device and to interrupt the process in order to check
definitions and implementing rules. 

### Wire frame
![Wire frame](resources/visual_design/b_wire_frame.jpg)

### Final design
TBD
## Solution Strategy
TBD
## C4 Model
TBD
### System Context diagram
TBD
### Container (App) diagram
TBD
### Component diagram
TBD
### Building Block View
TBD
### Runtime View
TBD
## Cross-cutting Concepts
TBD
## Architecture Decisions
TBD
## Conventions
### Coding Conventions

1. Classes, enums, typedefs, and extensions name should in ```UpperCamelCase```.
2. Libraries, packages, directories, and source files name should be in ```snake_case(lowercase_with_underscores)```.
3. Variables, constants, parameters, and named parameters should be in ```lowerCamelCase```.
4. Always specify the type of member when its value type is known. Avoid using ```var``` when possible.
5. Usually, The ```as``` cast operator throws an exception if the cast is not possible. To avoid an exception being thrown use ```is```.
6. Many times we need to render a widget based on some conditions in Row and Column. If conditional expression return null in any case then we should use if condition only.
7. Prefer using ?? (if null) and ?. (null aware) operators instead of null checks in conditional expressions.
8. When existing items are already stored in another collection, spread collection syntax leads to simpler code.
9. If we want to perform a sequence of operations on the same object then we should use the Cascades(..) operator.
10. For functions that contain just one expression, you can use an expression function. The ```=>``` (arrow) notation is used for expression function.
11. Use ```async/await``` overusing futures callback. Asynchronous code is hard to read and debug. The ```async/await``` syntax improves readability.
12. Split widgets into sub Widgets.
13. Use ListView.builder for a long list.
14. Use Const in Widgets. The widget will not change when setState call we should define it as constant. It will prevent the widget to rebuild so it improves performance.
15. Avoid lines longer than 80 characters.
16. Do use curly braces for all flow control statements.

For more details:

[Effective Dart](https://dart.dev/effective-dart) 
[Linter rules](https://dart.dev/tools/linter-rules)

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
- A feature branch is named like following: feature/\<name of feature_branch\>

#### Hotfix branches
![alt text](https://wac-cdn.atlassian.com/dam/jcr:cc0b526e-adb7-4d45-874e-9bcea9898b4a/04%20Hotfix%20branches.svg?cdnVersion=1240)
- Hotfix branches are used to quickly patch production releases
- Hotfix branches bases on the main branch
- If a bug it fixed it should be merged into the main and develop branch
- The main branch should be tagged with a new version
- A hotfix branch is named like following: hotfix/\<name of hotfix_branch\>

#### Additional: Private branches
If you are currently coding and you have to interrupt for a break or end of work then commit your 
current work into a private branch. 

- A private branch branches off from your current feature branch
- A private branch merges into your current feature branch
- When merging from private branch to feature branch then squash all commits by using a single commit message
- A private branch is named like following: private/\<your initials\>_\<name of feature_branch\>

#### Structure of a commit message

\<type\>:\<subject\> 

\<body\>

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
- Optional: can contain the specific ticket number for a work in following way [\<ticket number\>]

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
TBD
### Definition of Done
TBD
## Quality Requirements
TBD
## Risks and Technical Debts
TBD
## Glossary
TBD
