# medical_device_classifier

This app is used to classify a medical device. It is an implementation of the classification rules 
according to MDR Annex VIII (EU 2017/745) agreed by the European Parliament and the Council of the 
European Union on 5 April 2017.
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

[ ] The application determines the correct classification based on the algorithm described in Annex 
    VIII MDR 
[ ] The application is reachable via a web site and via the app stores of Android and Apple
[ ] The application is available in English, German and French language
[ ] The application allows the user to change a previous made decision

#### R2 Definitions specific to classification rules
As a medical device manufacturer, I would like to understand the Annex VIII MDR specific terms to 
make correct decisions during the classification process.

[ ] The user can search for specific term within a glossary
[ ] The Annex VIII MDR specific terms are available

#### R3 Reference to the app stores
As responsible of the Medical Device Classifier I would like to have references on the web site to 
the app stores in order to animate the users to download the app.

[ ] The web site contains a reference to the App Store of Apple
[ ] The web site contains a reference to the Play Store of Android



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

## Conventions

### Coding Conventions

### Definition of Ready

### Definition of Done

## Quality Requirements

## Risks and Technical Debts

## Glossary
