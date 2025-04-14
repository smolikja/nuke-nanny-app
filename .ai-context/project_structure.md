# Project Structure

This document outlines the recommended project structure for Flutter applications following Clean Architecture principles. This structure is designed to be scalable for medium-sized projects while maintaining clear separation of concerns.

## Directory Structure

The project follows a feature-first organization with clear separation of layers within each feature.

```text
lib/
├── app/                    # Application-specific code
│   ├── config/             # App configuration
│   ├── constants/          # App-wide constants
│   └── app.dart            # App entry point
│
├── core/                   # Core infrastructure and shared code
│   ├── error/              # Error handling and exceptions
│   ├── l10n/               # Localization resources
│   │   ├── app_en.arb        # English translations
│   │   ├── app_cs.arb        # Czech translations
│   │   └── l10n.dart         # Localization helpers
│   ├── navigation/         # Navigation/routing (Go Router configuration)
│   │   ├── router.dart       # Router configuration
│   │   ├── routes.dart       # Route path constants
│   │   └── routes_builder.dart # Route builders
│   ├── network/            # Network utilities
│   ├── providers/          # Core-level providers
│   ├── storage/            # Local storage utilities
│   ├── styles/             # App styling
│   │   ├── colors/           # Color definitions
│   │   ├── text_styles/      # Text style definitions
│   │   └── styles.dart       # Styles access point
│   ├── utils/              # Utility functions
│   └── widgets/            # Shared widgets
│
├── features/               # Application features
│   ├── feature_1/          # Example feature
│   │   ├── data/           # Data layer
│   │   │   ├── datasources/    # Data sources
│   │   │   ├── dto/            # Data Transfer Objects
│   │   │   ├── mappers/        # DTO to Entity mappers
│   │   │   └── repositories/   # Repository implementations
│   │   │
│   │   ├── di/             # Dependency injection
│   │   │   └── providers.dart   # Feature-specific providers
│   │   │
│   │   ├── domain/         # Domain layer
│   │   │   ├── entities/       # Business entities
│   │   │   ├── repositories/   # Repository interfaces
│   │   │   └── usecases/       # Use cases
│   │   │
│   │   └── presentation/   # Presentation layer
│   │       ├── pages/          # Pages/screens
│   │       ├── state/          # State definitions and notifiers
│   │       └── widgets/        # Feature-specific widgets
│   │
│   └── feature_2/          # Another feature with the same structure
│
└── main.dart              # Entry point
```

## Test Structure

Tests follow the same structure as the main code, making it easy to locate tests for specific components.

```text
test/
├── app/                    # Tests for app-wide code
├── core/                   # Tests for core utilities
└── features/               # Tests for features
    ├── feature_1/
    │   ├── data/           # Data layer tests
    │   │   ├── datasources/    # Data source tests
    │   │   ├── mappers/        # Mapper tests
    │   │   └── repositories/   # Repository tests
    │   │
    │   ├── domain/         # Domain layer tests
    │   │   └── usecases/       # Use case tests
    │   │
    │   └── presentation/   # Presentation layer tests
    │       ├── controllers/    # Controller tests
    │       └── pages/          # Widget/page tests
    │
    └── feature_2/          # Tests for another feature
```

## File Naming Conventions

Consistent file naming helps maintain a clean and navigable codebase.

### General Rules

- Use **snake_case** for file and directory names
- Use **lowercase** letters for all file and directory names
- Be descriptive but concise
- Group related files in appropriate directories

### Specific Conventions

#### Domain Layer

- Entity: `entity_name.dart` (e.g., `user.dart`)
- Repository Interface: `repository_name.dart` (e.g., `user_repository.dart`)
- Use Case: `use_case_name.dart` (e.g., `get_user_profile.dart`)

#### Data Layer

- Data Source: `data_source_name.dart` (e.g., `user_remote_data_source.dart`)
- DTO: `entity_name_dto.dart` (e.g., `user_dto.dart`)
- Repository Implementation: `repository_name_impl.dart` (e.g., `user_repository_impl.dart`)
- Mapper: `entity_name_mapper.dart` (e.g., `user_mapper.dart`)

#### Presentation Layer

- Page/Screen: `page_name_page.dart` or `screen_name_screen.dart` (e.g., `user_profile_page.dart`)
- Widget: `widget_name_widget.dart` (e.g., `user_avatar_widget.dart`)
- Controller: `controller_name_controller.dart` (e.g., `user_profile_controller.dart`)
- State: `state_name_state.dart` (e.g., `user_profile_state.dart`)

### Test Files

- Test files should match the name of the file being tested with `_test` suffix
- Example: `user_repository_impl_test.dart` tests `user_repository_impl.dart`

## Feature Organization

Features are organized to promote modularity and separation of concerns.

### Feature Structure

Each feature should:

1. Be self-contained with its own layers (data, domain, presentation)
2. Have minimal dependencies on other features
3. Expose only what's necessary for other features to use

### Shared Code

Code shared between features should be placed in the `core` directory. This includes:

- Utility functions
- Base classes
- Common widgets
- Shared interfaces

### Feature Communication

Features should communicate through:

1. Dependency injection (Riverpod providers)
2. Navigation/routing
3. Shared domain entities when necessary

## Barrel Files

Barrel files (index.dart) can be used to simplify imports, but should be used judiciously to avoid circular dependencies.

```dart
// features/auth/domain/domain.dart
export 'entities/user.dart';
export 'repositories/auth_repository.dart';
export 'usecases/login_user.dart';
export 'usecases/logout_user.dart';
export 'usecases/register_user.dart';
```

This allows importing multiple files with a single import:

```dart
import 'package:my_app/features/auth/domain/domain.dart';
```

## Key Packages and Technologies

The project uses the following key packages and technologies:

### State Management and Dependency Injection

- **flutter_riverpod**: For state management and dependency injection
  - Location: Used throughout the application, with providers defined in `app/di/` and feature-specific providers
  - File naming: `*_providers.dart` (e.g., `auth_providers.dart`)

### Navigation

- **go_router**: For declarative routing and navigation
  - Location: Main configuration in `app/navigation/router.dart`
  - Route definitions organized by feature in `app/navigation/routes/`

### Localization

- **flutter_localizations** and **intl**: For internationalization
  - Location: Localization files in `app/l10n/`
  - ARB files: `app_*.arb` (e.g., `app_en.arb`, `app_cs.arb`)
  - Generated files: `app_localizations.dart` and `app_localizations_*.dart`

### Network and API

- **dio**: For HTTP requests
  - Location: Base configuration in `core/network/`
  - Feature-specific API clients in each feature's data layer

### Local Storage

- **shared_preferences**: For simple key-value storage
- **sqflite** or **isar**: For more complex local database needs
  - Location: Base configuration in `core/storage/`
  - Feature-specific storage in each feature's data layer

## Localization Structure

The localization files are organized as follows:

```text
lib/
├── app/
│   ├── l10n/
│   │   ├── app_en.arb       # English translations
│   │   ├── app_cs.arb       # Czech translations
│   │   └── l10n.dart        # Localization helpers
```

Example ARB file (app_en.arb):

```json
{
  "appTitle": "My App",
  "welcomeMessage": "Welcome to My App!",
  "loginTitle": "Login",
  "emailLabel": "Email",
  "passwordLabel": "Password",
  "loginButton": "Login",
  "registerPrompt": "Don't have an account? Register here.",
  "@loginButton": {
    "description": "Label for the login button"
  }
}
```

## Conclusion

This project structure provides a clear organization for Flutter applications following Clean Architecture principles. It is designed to be:

- **Scalable**: Easily add new features without affecting existing code
- **Maintainable**: Clear separation of concerns makes code easier to understand and modify
- **Testable**: Each component can be tested in isolation
- **Flexible**: Implementation details can be changed without affecting the overall structure

By following these conventions and using the specified packages (Riverpod, Go Router, and l10n), we can create a consistent and organized codebase that is easy to navigate and maintain.
