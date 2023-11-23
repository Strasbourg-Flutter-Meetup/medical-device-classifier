# medical_device_classifier

This app is used to classify a medical device. It is an implementation of the classification rules
according to MDR Annex VIII (EU 2017/745) agreed by the European Parliament and the Council of the
European Union on 5 April 2017.

1. [Introduction and Goals](#introduction-and-goals)
    1. [Requirements Overview](#requirements-overview)
    2. [Quality Goals](#quality-goals)
    3. [Stakeholders](#stakeholders)
2. [Architecture Constraints](#architecture-constraints)
3. [System Scope and Context](#system-scope-and-context)
    1. [Business Context](#business-context)
    2. [Technical Context](#technical-context)
4. [Design](#design)
5. [Solution Strategy](#solution-strategy)
6. [C4 Model](#c4-model)
7. [Cross-Cutting Concepts](#cross-cutting-concepts)
    1. [State Management](#state-management)
    2. [Dependency Injection](#dependency-injection)
    3. [Routing](#routing)
    4. [I18N](#i18n)
8. [Architecture Decisions](#architecture-decisions)
9. [Conventions](#conventions)
10. [Quality Requirements](#quality-requirements)
11. [Risks and Technical Debts](#risks-and-technical-debts)
12. [Glossary](#glossary)

## Introduction and Goals

Annex VIII of the Medical Device Regulation (MDR) describes rules for a classification process of
medical devices. The aim is to transfer these rules into an application for training purposes,
which users can use to classify easily their medical device. The final application will be available
online as a web page and as an application in the Android Play Store or Apple's App Store.

### Requirements Overview

#### R1  Medical device classification

As a medical device manufacturer I would like to know which classification my product has in order
to know which measures must be taken.

- [x] The application determines the correct classification based on the algorithm described in
  Annex
  VIII MDR
- [ ] The application is reachable via a web site and via the app stores of Android and Apple
- [x] The application is available in English, German and French language
- [x] The application allows the user to change a previous made decision
- [x] Before the user starts the classification, he has to confirm the he knows the specific
  definitions regarding to the classification
- [x] Before the user starts the classification, he has to confirm the he knows the implementing
  rules regarding to the classification
- [x] Before the user starts the classification, he has to confirm that the device is a medical
  device

#### R2 Definitions specific to classification rules

As a medical device manufacturer, I would like to understand the Annex VIII MDR specific terms to
make correct decisions during the classification process.

- [ ] The user can search for specific term within a glossary
- [x] The Annex VIII MDR specific definitions are available
- [x] The MDCG 2021-24 definitions are available
- [x] The user can read the definitions before he starts the classifier
- [ ] The user can read the definitions during the classification process

#### R3 Implementing rules

As application provider, I would like that the user has the chance to read the implementing rules in
order to
ensure that the user is able to make correct decisions during the classification process.

- [x] The user can read the implementing rules before he starts the classifier
- [ ] The user can read the implementing rules during the classification process

#### R4 Reference to the app stores

As responsible of the Medical Device Classifier I would like to have references on the web site to
the app stores in order to animate the users to download the app.

- [ ] The web site contains a reference to the App Store of Apple
- [ ] The web site contains a reference to the Play Store of Android

#### R5 About us

As responsible of the Medical Device Classifier I would like to present the responsible Strasbourg
Flutter Meetup group and the responsible developers within the application in order to honor them.

- [x] The application describes the Strasbourg Flutter Meetup Group
- [x] The link to the Strasbourg Flutter Meetup is available
- [ ] The link to the repository is available, because it is an open source project

#### R6 Data protection

As responsible of the Medical Device Classifier I would like to be GDPR compliant in order not to
get any fee.

- [ ] The application contains a valid data protection statement

#### R7 Legal notice

Hint: Not sure if this is necessary, because it is a private project.

- [x] The application contains a valid legal notice
- [x] The user has to confirm initially that he read the legal notice and accepts the terms and
  conditions before he can use the app

#### R8 Definitions, Implementing Rules and Decision Tree must be updatable without updating the entire application

As responsible of the Medical Device Classifier I want that we can update definitions, implementing
rules and the Annex VIII MDR decision tree if required without that the user have to update the
entire application in order to be always up to date with the current specifications of the MDR and
MDCG.

- [x] Definitions can be downloaded from a server as json file
- [x] Implementing rules can be downloaded from a server as json file
- [x] Decision tree can be downloaded from a server as json file
- [x] Definitions, Implementing Rules and Decision Tree are in English, German and French available
- [x] The json strings will be stored in the SharedPreferences (Android) / NSUserDefaults (iOS) /
  LocalStorage (Web)
- [x] The local stored json strings gets tagged with a download date
- [x] The server side stored json strings get tagged with an updated date
- [x] When the updated date is younger than the download date, then the data will be updated
- [x] When any of the above mentioned json strings is not locally stored, it will be downloaded and
  stored locally

#### R9 Language selection

User Story:
As a user of the medical device classifier application, I want to be informed about the possibility
of translation errors in the French and German versions of the content. I want the application to
provide a sticky note notification that allows me to switch to the English version if I prefer or
continue using the French or German versions. Additionally, I want the flexibility to change the
language at any time, even if I initially choose to stay with the French or German content.

- [x] When I open the medical device classifier application, a sticky note with a notification is
  displayed prominently on the screen.
- [x] The sticky note contains a message that informs me about the possibility of translation errors
  in the French and German content. The message should be clear and concise, stating that the
  content is translated and may not be completely accurate.
- [x] I should have the ability to change the language at any time during my interaction with the
  application.
- [x] There should be a language settings menu or button within the application's user interface
  that allows me to easily switch between English, French, and German as needed.
- [x] After switching the language, the application's content, including labels, descriptions, and
  instructions, should update to the selected language.
- [x] The sticky note should always be displayed when the language is french or german.
- [x] The language switching functionality should be intuitive and user-friendly, ensuring that I
  can easily find and use it whenever I need to change the language.

#### R10 General explanation of rules

As application provider, I would like that the user has the chance to read the general explanation
of rules, which are described in the MDCG 2021-24 in order to ensure that the user is able to make
correct decisions during the classification process.

- [x] The user can read the general explanation of rules before he starts the classifier

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

The definition view exists to provide the user MDR VIII and MDCG 2021-24 specific definitions in
order
to allow the user to gain understandings about the used terms. Furthermore a separated Defintions
view
can be easily accessed from anywhere within the application, which will satisfy some specific
requirements
in **R2 Definitions specific to classification rules**.

#### Implementing Rules

The implementing rule view exists to provide the user MDR III specific impelementation rules in
order to allow the user to use the classifier correctly. Furthermore a separated Implementing Rules
view can be easily accessed from anywhere within the application, which will satisfy some specific
requirements in **R3 Implementing rules**.

#### General explanation of rules

The general explanation of rules view exist to provide the user the MDCG explanations of rules in
ir order to allow the user to use the classifier correctly.It satisfies the the requirement **R10
General explanation of rules**.

#### Data Protection

Contains a standard data protection statement. Especially that we have to mention our hoster and
that we
have a GDPR order processing agreement. We also have to mention their data protection and if they
collect
any data (e. g. IP addresses) we have to mention that.

#### Legal Notice

Not sure if we really require that, because the website and the application is private.

Nevertheless I mentioned some information, which should be published.

- The identity of the entrepreneur and the name of the company’s corporate name;
- The contact details of the company’s head office;
- A contact email address and a telephone number;
- The registration number in the Trade and Companies Register (RCS) or the Trade Register (RM);
- The intra-community VAT number;
- References to the professional rules applicable and to the professional title in the context of a
  regulated profession;
- The contact details of the site host (identity, address, telephone number of the host);
- The General Terms and Conditions of Sale (GTC);
- The Declaration number of the french Commission Nationale Informatique et des Libertés (CNIL);
- The law applicable in the event of a dispute;
- A disclaimer of liability clause;
- The use of cookies and tracking devices (allowing the collection of personal data);
- Information on your partnerships (affiliation service);
- Allow people who register on your site using their contact information to contact you to change or
  delete this information

[Source](https://www.bonnefous.com/en/blog/what-are-the-mandatory-legal-notices-on-the-internet-in-france/)

#### About Us

At the About Us view we will describe the Strasbourg Flutter Meetup Group and the motivation why we
developed this classifier.

#### Classifier Introduction & Classifier Precondition

Allows a deeper explanation of the classifier and to make sure that the user is aware of the
specific definitions, implementing rules and the status of its device. The user shall proof that, by
confirming the understanding of the definitions, implementing rules and the status of its device.

#### Classifier

The classifier view allows the user classify its device and to interrupt the process in order to
check definitions and implementing rules.

### Wire frame

![Wire frame](resources/visual_design/b_wire_frame.jpg)

### Final design

#### Web

##### Medium / Large (light mode)

![Dashboard Large](resources/visual_design/final_design/web/web_dashboard_large.png)
*Dashboard Large*

![Dashboard Medium](resources/visual_design/final_design/web/web_dashboard_m.png)
*Dashboard Medium*

![Dashboard Translation Info](resources/visual_design/final_design/web/web_dashboard_translation_info.png)
*Dashboard with additional translation information, when selected language is not english*

![Classification Introduction](resources/visual_design/final_design/web/web_classification_intro_lm.png)
*Classifier Introduction*

![Classification Precondition](resources/visual_design/final_design/web/web_classification_preconditions_ml.png)
*Classifier Preconditions*

![Classifier](resources/visual_design/final_design/web/web_classifier_ml.png)
*Classifier*

![Definitions](resources/visual_design/final_design/web/web_definitions_ml.png)
*Definitions*

![Implementing Rules](resources/visual_design/final_design/web/web_impl_rules_ml.png)
*Implementing Rules*

![General Explanation of Rules](resources/visual_design/final_design/web/web_general_expl_rules_ml.png)
*General explanation of rules*

![About us](resources/visual_design/final_design/web/web_about_us_ml.png)
*About us*

![Privacy Policy](resources/visual_design/final_design/web/web_privacy_policy_ml.png)
*Privacy Policy*

![Legal Information](resources/visual_design/final_design/web/web_legal_info_ml.png)
*Legal Information*

![Language Selection](resources/visual_design/final_design/web/web_language_selection_ml.png)
*Language selection*

##### Small (dark mode)

![Dashboard](resources/visual_design/final_design/web/web_dashboard_s.png)
*Dashboard*

1. The tile buttons wrap to a column.
2. The footer items wrap to a column.
3. The "About Us" button in the app bar disappeared and is accessible via the menu button.

![Menu](resources/visual_design/final_design/web/web_menu_s.png)
*Menu*

#### Mobile
![Dashboard](resources/visual_design/final_design/sp_tb/sp_img1.png)
*Dashboard*

![Classifier](resources/visual_design/final_design/sp_tb/sp_img2.png)
*Classifier*

![Definitions](resources/visual_design/final_design/sp_tb/sp_img3.png)
*Definitions*

![Implementing Rules](resources/visual_design/final_design/sp_tb/sp_img4.png)
*Implementing Rules*

![Rules](resources/visual_design/final_design/sp_tb/sp_img5.png)
*General explanation of rules*

![Dashboard](resources/visual_design/final_design/sp_tb/sp_img6.png)
*Menu*

![About Us](resources/visual_design/final_design/sp_tb/sp_img7.png)
*About us*

#### Tablet
![Dashboard](resources/visual_design/final_design/sp_tb/tb10_img1.jpg)
*Dashboard*

![Classifier](resources/visual_design/final_design/sp_tb/tb10_img2.jpg)
*Classifier*

![Definitions](resources/visual_design/final_design/sp_tb/tb10_img3.jpg)
*Definitions*

![Implementing Rules](resources/visual_design/final_design/sp_tb/tb10_img4.jpg)
*Implementing Rules*

![Rules](resources/visual_design/final_design/sp_tb/tb10_img5.jpg)
*General explanation of rules*

![Dashboard](resources/visual_design/final_design/sp_tb/tb10_img6.jpg)
*Menu*

![About Us](resources/visual_design/final_design/sp_tb/tb10_img7.jpg)
*About us*

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

### State management

#### State and StateData

##### State

The application knows five different states:

**initial**: Typically represents the initial state of an entity or component, signifying a starting
point before any specific data or content is loaded or displayed.

**initialized**: Indicates that an entity or component has been initialized and is ready for further
actions. It may contain optional data set during initialization.

**loading**: Represents a state of activity where data is being fetched, processed, or loaded. Often
used to provide feedback to users that an operation is in progress.

**loaded**: Signifies the successful completion of a loading or data retrieval operation. It usually
includes the loaded data and indicates that the component is ready to display it.

**error**: Indicates that an error or exception has occurred. Used to handle and communicate error
conditions to the user.

##### StateData

StateData is a crucial concept in your application's architecture. It refers to a model or data
structure that holds information or context associated with a particular state in your app. This
data is essential for providing meaning and content to the various states your application can be
in.

For example, in a dashboard application, you might have different states like "loading," "loaded,"
and "error." The StateData for each of these states would contain specific information:

- **Loading StateData**: This could include messages or flags indicating that data is currently
  being fetched or processed. It provides feedback to the user that an operation is underway.
- **Loaded StateData**: This typically contains the data that was successfully retrieved and is
  ready to be displayed. For a dashboard, it might include user information, statistics, or any
  other relevant content.
- **Error StateData**: In case of an error, the StateData would include details about the error,
  such as an error message or code. This allows your application to handle and communicate errors
  effectively.

Having well-defined StateData for each state is crucial for maintaining a clean and organized
codebase. It ensures that your UI components can easily access the relevant information for
rendering the correct content based on the current state.

#### UI

The UI (User Interface) is the part of your application that's responsible for rendering and
displaying the content to the user. In the context of your application's architecture, the UI plays
a vital role in visualizing the different states and their corresponding StateData.

For example, when your application transitions from the "loading" state to the "loaded" state, the
UI is responsible for displaying the fetched data in a user-friendly manner. This could involve
rendering charts, tables, or any other widgets that make sense for your dashboard.

Additionally, the UI should handle the "error" state gracefully, presenting error messages or
offering options for the user to recover from the error.

In essence, the UI acts as the bridge between your application's logic (handled by cubits and
states) and the user's interaction. It's where users see and interact with the content and where
your application's usability and user experience are defined.

To summarize, the StateData provides the necessary information for each state, while the UI is
responsible for presenting that data to the user in an understandable and visually appealing way.
These two components work together to create a responsive and user-friendly application.

#### Cubit

A cubit is a class, which extends from [Cubit](https://bloclibrary.dev/#/coreconcepts?id=cubit).
The minimum set up requires following constructors and members:

1. Named constructor without additional identifier, which requires to get an initial state injected
2. A private _stateData object, where the data type is the same like your previous defined state
   data
3. A list of private member variables, which are required by the state data object
4. A public initialize method, which will be called as soon as the cubit was created
5. A private updateStateData method, which updates the state data object

**Hint**
Every time, when the UI shall be updated an emit of the loading and loaded state is necessary.
Best practice is to wrap both emits around the logic, so that the user sees a loading state until
the loaded data will be finally emitted to the ui.

Example:

```dart
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(super.initialState, {
    required this.usernameRepository,
  });

  UserNameRepository userNameRepository;

  DashboardStateData? _stateData;

  String _username = '';

  Future<void> initialize() async {
    emit(const DashboardState.loading());
    await _loadUsername();
    _updateStateData();
    emit(DashboardState.loaded(data: _stateData));
  }

  void _updateStateData() {
    _stateData = DashboardStateData(username: _username);
  }

  Future<void> _loadUserName() async {
    // ... load and set user name
    _username = await usernameRepository.loadUsername();
  }
}

```

### Dependency Injection

For the dependency injection we are using the [get_it](https://pub.dev/packages/get_it) package.

Please read the documentation [get_it](https://pub.dev/packages/get_it) before in order to get
familiar with it.

#### Add a new dependency

Within a injections configuration you can add a dependency like following:

```dart
void configureGetItInjections() {
  getIt.registerFactory<ServiceA>(
        () => ServiceA(),
  );

  getIt.registerFactory<MyCubit>(
        () =>
        DashboardCubit(
          serviceA: getIt.get<ServiceA>(),
        ),
  );
}
```

The example above shows how a cubit gets registered and a ServiceA class injected to the cubit.

#### Use a dependency

Each dependency, when it is registered, gets called like following:

```dart

MyService myService = getIt.get<MyService>();
```

You can call each registered dependency anywhere in your code, but we use it only in order to
inject dependencies into new instantiated classes.

#### Create a new injection configuration

1. Create a file with the pattern 'injection_<type_of_injection>.dart', e. g. '
   injection_services.dart'
2. Extend the class from InjectionConfiguration
3. Add your dependency to your configuration
4. Add your new injection configuration to the injectionConfigurations within the
   method ```_configureGetIt``` which you can find in the ```main.dart``` file

### Routing

#### General

For navigating throw the application we are using
the [go_router](https://pub.dev/packages/go_router)
package. Based on the view flow the Dashboard screen is the initial screen which the user will see.
From here we are using
only [child routes](https://pub.dev/documentation/go_router/latest/topics/Configuration-topic.html)
in order to configure our routing system.

Please read the below documentation and the documentation
of [go_router](https://pub.dev/packages/go_router)
carefully before working with the routing system.

#### Step 1: Add path

In order to add a path you have to add a path and a name to the [go_router_path.dart] file.

Lets add for example screen with the name "ImplementingRules":

```dart
// paths
const String pathToDashboard = '/';
const String pathToDefinitions = 'definitions';
const String pathToImplementingRules = 'implementingRules'; // new

// names
const String nameToDefinitions = 'definitions';
const String nameToImplementingRules = 'implementingRules'; // new
```

If you want to pass an parameter to the new route, then please update the [go_router_path.dart] file
like following:

```dart
// paths
const String pathToDashboard = '/';
const String pathToDefinitions = 'definitions';
const String pathToImplementingRules = 'implementingRules/:myParameter'; // new

// names
const String nameToDefinitions = 'definitions';
const String nameToImplementingRules = 'implementingRules'; // new
```

Several parameters can be added in a row:

```dart
// paths
const String pathToDashboard = '/';
const String pathToDefinitions = 'definitions';
const String pathToImplementingRules = 'implementingRules/:myParameter1/:myParameter2'; // new

// names
const String nameToDefinitions = 'definitions';
const String nameToImplementingRules = 'implementingRules'; // new
```

#### Step 2: Add configuration

In order to add a configuration please open the file [go_router_configuration.dart].

There you must add a new private variable where the name has to look like following pattern:
```_to<name of screen>```.

In the next step you assign a [GoRoute] object to the variable and you configure it like following:

1. Add path
2. Add name
3. Add pageBuilder with custom fade transition
4. Optional: add routes

Example:

```dart

final _toDefinitions = GoRoute(
  path: pathToDefinitions,
  name: nameToDefinitions,
  pageBuilder: (context, state) =>
      CustomTransitionPage(
        transitionsBuilder: (context, animation, secondaryAnimation, child,) =>
            FadeTransition(
              opacity: animation,
              child: child,
            ),
        child: const Definitions(), //screen to display
      ),
);
```

#### Step 3: Update router

In order to use the new route you have to add a route method to the router, which you can call
globally within the entire application.

Example:

```dart
void routeToDefinitions() {
  goRouterContext?.goNamed(
    pathToDefinitions,
  );
}
```

#### Step 4: Use router

To use the router method you can call it anywhere in your code. E. g. when a user clicks on a button
or the state of your app changes and makes a navigation necessary.

Example

```dart

final button = ElevatedButton(
  onPressed: routeToDefinitions,
  child: Text(
    'Definitions',
  ),
);
```

### I18N

#### How to add a new message?

In order to add a new message you have to create for each l10n a new message.

Following steps you have to do:

1. navigate to the folder l10n
2. add your message to each language (EN, DE and FR)
3. Use your new message anywhere in your code
4. Execute ```flutter run```

#### How to use your new message?

Use the ```AppLocalizations.of(context)!.<variable_name>``` in order to access your message within
the code. You can find an example here:

```flutter
Scaffold(
  appBar: AppBar
    (
        // The [AppBar] title text should update its message
        // according to the system locale of the target platform.
        // Switching between English and Spanish locales should
        // cause this text to update.
        title: Text(AppLocalizations.of(context)!.helloWorld
    ),
  ),
);
```

#### When will the new message be created?

The new string will be created after executing the executing the ```flutter run``` command.
Before, the new message is shown as not available. You also can start the application within the
IDE.
This will also trigger the ```flutter run``` command.

#### Sources

If you want to know more about I18N in flutter please
check [here](https://docs.flutter.dev/ui/accessibility-and-localization/internationalization).

## Architecture Decisions

### ADR001 Backend selection

In the context of **R8 Definitions, Implementing Rules and Decision Tree must be updatable without
updating the entire application**, facing the concern that we need a backend we decided
for Supabase and neglected Appwrite, to make sure that the definitions, implementing rules and
decision tree can be updated without updating the Android or iOS app, accepting that they are paused
after 1 week of inactivity, because of a lack of documentation regarding Flutter and Appwrite,
existing knowledge and code snippets regarding supabase and knowledge about a workaround to avoid
the one week inactivity limitation.

### ADR002: Language Translation Management in Medical Device Classifier Application

#### Context

In the context of the Medical Device Classifier Application, there is a need to manage translations
for content in French and German while maintaining the ability to update definitions, implementing
rules, and the decision tree without requiring a full application update. The primary concern is to
ensure that users are informed about the potential risk of translation inaccuracies and to provide
them with options to switch between languages or contact us in case of identifying incorrect
translations.

#### Decision

After evaluating various options, the following decisions have been made:

##### Decision 1: Translation Risk Notification

To address the risk of translation inaccuracies, a sticky note notification will be implemented
within the application. This notification will inform users about the possibility of translation
errors and provide them with options to switch to the original English content.

##### Decision 2: Language Switching

Users will have the flexibility to switch between languages (English, French, and German) within the
application at any time. This feature allows users to choose their preferred language for using the
application.

##### Decision 3: User Feedback Mechanism

To further enhance translation quality and user engagement, a user feedback mechanism will be
included in the application. Users will have the option to report translation errors or provide
feedback on the content. This mechanism will help identify and address any inaccuracies promptly.

##### Decision 4: Solution Selection

Solution 'a,' involving the use of professional translation services, is not feasible for our
non-profit group due to budget constraints. Therefore, we will not pursue this option.

#### Consequences

These decisions aim to mitigate the risk of translation inaccuracies and provide users with a better
experience when using the Medical Device Classifier Application. Users will be informed about the
risk and given the choice to switch languages or report errors, enhancing overall user satisfaction
and application usability.

#### Additional Information (Optional)

For users who identify incorrect translations and wish to report them, an email address, such as '
translations@medicaldeviceapp.org,' will be provided within the application. This email address will
serve as a channel for users to contact us and contribute to improving the quality of translations.
We value user feedback and are committed to addressing translation issues promptly.

Decision Date: 11/11/2023

Decision Makers: DKR

Email for Translation Feedback: translations@medicaldeviceapp.org (Optional)

## Conventions

### Coding Conventions

1. Classes, enums, typedefs, and extensions name should in ```UpperCamelCase```.
2. Libraries, packages, directories, and source files name should be
   in ```snake_case(lowercase_with_underscores)```.
3. Variables, constants, parameters, and named parameters should be in ```lowerCamelCase```.
4. Always specify the type of member when its value type is known. Avoid using ```var``` when
   possible.
5. Usually, The ```as``` cast operator throws an exception if the cast is not possible. To avoid an
   exception being thrown use ```is```.
6. Many times we need to render a widget based on some conditions in Row and Column. If conditional
   expression return null in any case then we should use if condition only.
7. Prefer using ?? (if null) and ?. (null aware) operators instead of null checks in conditional
   expressions.
8. When existing items are already stored in another collection, spread collection syntax leads to
   simpler code.
9. If we want to perform a sequence of operations on the same object then we should use the
   Cascades(..) operator.
10. For functions that contain just one expression, you can use an expression function.
    The ```=>``` (arrow) notation is used for expression function.
11. Use ```async/await``` overusing futures callback. Asynchronous code is hard to read and debug.
    The ```async/await``` syntax improves readability.
12. Split widgets into sub Widgets.
13. Use ListView.builder for a long list.
14. Use Const in Widgets. The widget will not change when setState call we should define it as
    constant. It will prevent the widget to rebuild so it improves performance.
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
- To merge the feature branch to the develop branch requires always a pull request, code review and
  an approval

#### Release branches

![alt text](https://wac-cdn.atlassian.com/dam/jcr:8f00f1a4-ef2d-498a-a2c6-8020bb97902f/03%20Release%20branches.svg?cdnVersion=1240)

- A release branch is always a fork of the current develop branch
- No new features are allowed to add to the release branch
- Bug fixes, documentation and release oriented tasks are allowed to commit
- When the release branch is ready, it gets merged into the main branch and tagged with a version
  number
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
- When merging from private branch to feature branch then squash all commits by using a single
  commit message
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

### Translation Accuracy Risk in Medical Device Classifier Application

#### Risk Description:

The Medical Device Classifier Application relies on translations for content in French and German,
while the primary content is in English. There is a risk that the translations may contain
inaccuracies, which could lead to misunderstandings or incorrect interpretations of the medical
device information.

#### Risk Probability:

Low to Medium
The probability of translation errors depends on the quality of the translation process and the
expertise of the translators. If professional translation services are used, the risk is lower.
However, human error and language nuances may still introduce inaccuracies.

#### Risk Impact:

Low to High
The impact of translation errors can vary:
Low Impact: Minor grammatical or typographical errors that do not affect the overall understanding.
Medium Impact: Translation errors that lead to slight confusion but do not compromise user safety.
High Impact: Translation errors that miscommunicate critical medical information, potentially
leading to user misunderstanding or incorrect device classification.

#### Risk Mitigation:

To mitigate the risk of translation inaccuracies, the following measures can be taken:

a. Professional Translation: Use professional translation services or experts proficient in medical
terminology to ensure accurate translations.

b. User Notification: Implement a sticky note notification within the application, informing users
about the possibility of translation errors. Offer users the choice to switch to the original
English content.

c. Language Switching: Allow users to switch between languages (English, French, and German) within
the application at any time, providing flexibility to choose their preferred language.

d. Continuous Monitoring: Regularly review and update translations based on user feedback and
accuracy assessments. Correct any identified errors promptly.

e. User Feedback Mechanism: Include a feature that allows users to report translation errors or
provide feedback on the content.

#### Risk Acceptance:

The level of risk acceptance depends on the criticality of the medical device information and the
consequences of translation errors. High-impact inaccuracies should be considered unacceptable,
while low-impact errors may be tolerated to some extent. Continuous improvement and monitoring of
translations are essential.

Risk Monitoring:
Monitor user feedback and reports of translation errors. Regularly assess the quality and accuracy
of translations. Adjust risk mitigation strategies based on the observed impact and user feedback.

## Glossary

TBD
