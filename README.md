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

If you want to know more about L18N in flutter please
check [here](https://docs.flutter.dev/ui/accessibility-and-localization/internationalization).

## Architecture Decisions

## Conventions

### Coding Conventions

### Definition of Ready

### Definition of Done

## Quality Requirements

## Risks and Technical Debts

## Glossary
