# medical_device_classifier

This app is used to classify a medical device. It is an implementation of the classification rules
according to MDR Annex VIII (EU 2017/745) agreed by the European Parliament and the Council of the
European Union on 5 April 2017.

## Introduction and Goals

### Requirements Overview

### Quality Goals

### Stakeholders

## Architecture Constraints

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

### Routing

#### General

For navigating throw the application we are using the [go_router](https://pub.dev/packages/go_router) 
package. Based on the view flow the Dashboard screen is the initial screen which the user will see.
From here we are using only [child routes](https://pub.dev/documentation/go_router/latest/topics/Configuration-topic.html)
in order to configure our routing system. 

Please read the below documentation and the documentation of [go_router](https://pub.dev/packages/go_router) 
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
        child: const Definitions(), // this is the screen to display
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
