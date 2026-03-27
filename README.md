# flutter_validation

A lightweight Flutter package for simple, chainable form validation.

Right now the package focuses on email validation through a fluent API, so you can stack rules and return the first validation error as a `String?`.

## Features

- Chain multiple email validation rules in a readable way
- Return `null` when validation passes
- Return the first validation message when validation fails
- Keep validation logic outside widgets and forms

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_validation:
    path: ../flutter_validation
```

Then run:

```bash
flutter pub get
```

## Import

```dart
import 'package:flutter_validation/flutter_validation.dart';
```

## Basic Usage

Use `Validatiors` to start a validation chain and call `validate()` at the end.

```dart
final error = Validatiors()
    .emailValidator(value: 'bharat.sc01@gmail.com')
    .isRequired()
    .isValidEmail()
    .noSpaces()
    .validate();

if (error == null) {
  print('Email is valid');
} else {
  print(error);
}
```

This works well with Flutter form fields:

```dart
TextFormField(
  validator: (value) => Validatiors()
      .emailValidator(value: value)
      .isRequired()
      .isValidEmail()
      .noSpaces()
      .singleAtSymbol()
      .noConsecutiveDots()
      .validate(),
)
```

## Available Email Rules

The current email validator supports these chainable methods:

- `isRequired()`
- `isValidEmail()`
- `noSpaces()`
- `hasAtSymbol()`
- `allowDomain(List<String> domains)`
- `minLength(int length)`
- `maxLength(int length)`
- `singleAtSymbol()`
- `noStartingDot()`
- `noEndingDot()`
- `noConsecutiveDots()`
- `validate()`

## Examples

Validate that an email includes `@`:

```dart
final error = Validatiors()
    .emailValidator(value: 'bharat.sc01.com')
    .hasAtSymbol()
    .validate();
```

Restrict allowed domains:

```dart
final error = Validatiors()
    .emailValidator(value: 'user@company.com')
    .allowDomain(['.com', '.in', '.outlook'])
    .validate();
```

Apply multiple checks together:

```dart
final error = Validatiors()
    .emailValidator(value: ' user..name@gmail.com ')
    .isRequired()
    .noSpaces()
    .singleAtSymbol()
    .noStartingDot()
    .noEndingDot()
    .noConsecutiveDots()
    .validate();
```

## How Validation Works

Each rule checks the current value and stores the first error it finds. Once an error has been set, later rules do not replace it. `validate()` returns:

- `null` when the value passes all applied rules
- An error message when a rule fails

## Current Scope

The public API currently provides:

- Email validation support through `emailValidator(...)`
- A placeholder `contactValidator(...)` method that is not yet implemented with validation rules

## Testing

Run the package tests with:

```bash
flutter test
```

## Notes

- The entry class is named `Validatiors` in the current implementation.
- `emailValidator` expects a non-null value internally, so it is safest to use it with form values that are present or passed directly from a validator callback.
