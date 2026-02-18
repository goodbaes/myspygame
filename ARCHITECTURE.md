# Architecture Documentation

This document outlines the architectural patterns and design decisions made in this project to ensure scalability, maintainability, and testability.

## 1. Modular Workspace

The project is structured as a **Flutter Workspace**. This allows us to separate concerns into independent packages that can be developed and tested in isolation.

### Directory Structure

- `lib/`: The main entry point (root app) which orchestrates the features.
- `packages/core/`:
  - `architecture/`: Shared infrastructure, base classes, and services.
  - `domain/`: Business entities and logic, free from UI dependencies.
- `packages/features/`:
  - Independent functional modules (e.g., `roles_screen`).

## 2. Core Concepts

### Feature-Based Registration

Features are registered via a `FeatureRegistry` during app startup. This promotes loose coupling and allows for easy toggling or swapping of features.

```dart
final featureRegistry = FeatureRegistry();
featureRegistry.register(RolesFeature());
```

### Dependency Injection & Navigation

The project utilizes a centralized `NavigationService` to handle screen transitions without relying on `BuildContext` when necessary, promoting a cleaner separation between the UI and logic.

## 3. Data Flow

We follow a unidirectional data flow pattern where:

1. **User Action** triggers an event in the presentation layer.
2. **Logic** (via BLoC or Controllers) interacts with the **Domain Layer**.
3. **State** is updated and propagated back to the **UI**.

## 4. Error Handling

Consistent error handling is achieved through explicit result types and domain-specific exceptions, ensuring that the UI can gracefully handle any failures.
