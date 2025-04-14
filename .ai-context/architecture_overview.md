# Architecture Overview

This document outlines the architecture of our Flutter applications, based on Clean Architecture and SOLID principles. This architecture is designed to create maintainable, testable, and scalable mobile applications.

## Architectural Layers

### 1. Presentation Layer (UI)

The presentation layer is responsible for displaying data to the user and handling user interactions.

**Components:**

- **Pages/Screens**: Full-screen UI components
- **Widgets**: Reusable UI components
- **Controllers/ViewModels**: Manage UI state and business logic for specific screens
- **State Management**: Using Riverpod for reactive state management

**Responsibilities:**

- Render UI elements
- Handle user input
- Manage UI state
- Navigate between screens
- Format data for display

**Dependencies:**

- Depends only on the Domain layer
- No direct dependencies on the Data layer

### 2. Domain Layer

The domain layer contains the core business logic and rules of the application.

**Components:**

- **Entities**: Core business objects
- **Use Cases**: Application-specific business rules
- **Repository Interfaces**: Abstract definitions for data operations
- **Value Objects**: Immutable objects with validation logic

**Responsibilities:**

- Define the core business logic
- Establish business rules and validations
- Define interfaces for data operations

**Dependencies:**

- No dependencies on other layers
- No dependencies on Flutter or external packages (pure Dart)

### 3. Data Layer

The data layer is responsible for data retrieval and persistence.

**Components:**

- **Repositories**: Implementations of repository interfaces from the Domain layer
- **Data Sources**: API clients, database handlers, etc.
- **DTOs (Data Transfer Objects)**: Objects for data mapping
- **Mappers**: Convert between DTOs and Domain entities

**Responsibilities:**

- Fetch data from external sources (API, database)
- Map external data to domain entities
- Implement caching strategies
- Handle data persistence

**Dependencies:**

- Depends on the Domain layer for repository interfaces
- May depend on external packages for networking, storage, etc.

## Navigation

We use Go Router for navigation, which provides a declarative, path-based routing approach that supports deep linking and nested navigation.

**Key Features:**

- Path-based routing with type-safe route parameters
- Support for nested navigation
- Deep linking support
- Integration with Riverpod for reactive routing
- Redirection and route guards for authentication flows

**Example:**

```dart
// Router factory function
GoRouter getRouter(WidgetRef ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: Routes.home,
    redirect: (context, state) {
      // Redirect logic for authentication
      final isLoggedIn = authState.isAuthenticated;
      final isLoginRoute = state.location == Routes.login;

      if (!isLoggedIn && !isLoginRoute) {
        return Routes.login;
      }

      if (isLoggedIn && isLoginRoute) {
        return Routes.home;
      }

      return null;
    },
    routes: [
      RoutesBuilder.buildHomeRoute(ref),
      RoutesBuilder.buildLoginRoute(ref),
      RoutesBuilder.buildProfileRoute(ref),
    ],
    errorBuilder: (context, state) =>
        ErrorPage(error: 'Page was not found.', stack: StackTrace.current),
  );
}

// Routes class for path definitions
class Routes {
  // MARK: - Main Routes
  static const String home = '/home';
  static const String login = '/login';
  static const String profile = '/profile';

  // MARK: - Sub Routes
  static const String detail = '/detail/:id';

  // MARK: - Parametrized Path Getters
  static String getProfilePath(String userId) => '$profile/$userId';
}

// RoutesBuilder class for route configuration
class RoutesBuilder {
  // MARK: - Home
  static GoRoute buildHomeRoute(WidgetRef ref) {
    return GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) => const MaterialPage(
        child: HomePage(),
      ),
    );
  }

  // MARK: - Login
  static GoRoute buildLoginRoute(WidgetRef ref) {
    return GoRoute(
      path: Routes.login,
      pageBuilder: (context, state) => const MaterialPage(
        child: LoginPage(),
      ),
    );
  }

  // MARK: - Profile
  static GoRoute buildProfileRoute(WidgetRef ref) {
    return GoRoute(
      path: Routes.profile,
      pageBuilder: (context, state) => const MaterialPage(
        child: ProfilePage(),
      ),
    );
  }
}
```

## Localization

We use Flutter's intl package with l10n for localization, which provides a type-safe way to handle translations.

**Key Features:**

- Type-safe access to localized strings
- Support for plurals and gender-specific translations
- Integration with the Flutter ecosystem
- Automatic generation of localization files

**Example:**

```dart
// In app.dart
return MaterialApp.router(
  routerConfig: ref.watch(routerProvider),
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  // Other app configuration
);

// Usage in widgets
final l10n = AppLocalizations.of(context);
Text(l10n.welcomeMessage);
```

## Data Flow

1. **User Interaction**: User interacts with the UI
2. **UI Event**: UI dispatches an event to the controller/ViewModel
3. **Use Case Execution**: Controller calls a Use Case from the Domain layer
4. **Repository Call**: Use Case calls Repository methods
5. **Data Source Access**: Repository implementation uses Data Sources
6. **Response Flow**: Data flows back up through the layers, with appropriate transformations at each level
7. **UI Update**: UI is updated with the new data

## Dependency Injection

We use Riverpod for dependency injection, which provides a simple and testable way to manage dependencies.

**Key Principles:**

- Dependencies are provided through providers
- Providers are organized by feature
- Scoped providers are used for feature-specific dependencies
- Global providers are used for application-wide dependencies

**Example:**

```dart
// Repository provider
final userRepositoryProvider = Provider<UserRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final localDb = ref.watch(localDbProvider);
  return UserRepositoryImpl(apiClient: apiClient, localDb: localDb);
});

// Use case provider
final getUserProfileUseCaseProvider = Provider<GetUserProfileUseCase>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return GetUserProfileUseCase(repository: repository);
});

// Controller provider
final userProfileControllerProvider = StateNotifierProvider<UserProfileController, UserProfileState>((ref) {
  final getUserProfile = ref.watch(getUserProfileUseCaseProvider);
  return UserProfileController(getUserProfile: getUserProfile);
});
```

## State Management

We use Riverpod for state management, which provides a reactive and testable approach to managing application state.

**State Management Patterns:**

1. **UI State**: Managed by StateNotifier or StateProvider
2. **Application State**: Managed by StateNotifier or Provider
3. **Ephemeral State**: Managed by StatefulWidget when appropriate

**State Organization:**

- State is organized by feature
- State is immutable and updated through events/actions
- State changes are propagated through providers

**Example:**

```dart
// State class
class UserProfileState {
  final User? user;
  final bool isLoading;
  final String? error;

  const UserProfileState({this.user, this.isLoading = false, this.error});

  UserProfileState copyWith({User? user, bool? isLoading, String? error}) {
    return UserProfileState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

// Controller class
class UserProfileController extends StateNotifier<UserProfileState> {
  final GetUserProfileUseCase _getUserProfile;

  UserProfileController({required GetUserProfileUseCase getUserProfile})
      : _getUserProfile = getUserProfile,
        super(const UserProfileState());

  Future<void> loadUserProfile(String userId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final user = await _getUserProfile(userId);
      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }
}
```

## Error Handling

Error handling is implemented at multiple levels of the application.

**Error Handling Strategies:**

1. **Domain Layer**: Uses custom exceptions and Result objects
2. **Data Layer**: Catches and transforms external exceptions
3. **Presentation Layer**: Displays user-friendly error messages

**Error Types:**

- **NetworkError**: For connectivity issues
- **ServerError**: For server-side errors
- **CacheError**: For local storage errors
- **ValidationError**: For input validation errors
- **AuthenticationError**: For authentication issues

**Example:**

```dart
// Result class for error handling
class Result<T> {
  final T? data;
  final AppError? error;

  Result.success(this.data) : error = null;
  Result.failure(this.error) : data = null;

  bool get isSuccess => error == null;
  bool get isFailure => error != null;
}

// Error class hierarchy
abstract class AppError {
  final String message;
  final StackTrace? stackTrace;

  AppError(this.message, [this.stackTrace]);
}

class NetworkError extends AppError {
  NetworkError(String message, [StackTrace? stackTrace]) : super(message, stackTrace);
}

class ServerError extends AppError {
  final int? statusCode;

  ServerError(String message, {this.statusCode, StackTrace? stackTrace}) : super(message, stackTrace);
}
```

## Styling Architecture

We use a centralized styling approach that provides consistent access to colors and text styles throughout the application.

**Key Components:**

- **Styles Class**: A singleton that provides access to colors and text styles
- **Color Scheme Interface**: Defines the color palette for the application
- **Theme-Aware Colors**: Implementations for light and dark themes
- **Text Styles**: Consistent typography definitions

**Example:**

```dart
// Styles access point
class Styles {
  static AppColors appColors = AppColors();
  static TextStyles textStyles = TextStyles();
}

// Color scheme interface
abstract class AppColorsScheme {
  Color get primary;
  Color get onPrimary;
  Color get secondary;
  Color get onSecondary;
  Color get error;
  Color get onError;
  Color get success;
  Color get onSuccess;
}

// Theme-aware colors implementation
class AppColors implements AppColorsScheme {
  factory AppColors() {
    return _appColors;
  }
  AppColors._internal();
  static final AppColors _appColors = AppColors._internal();

  AppColorsScheme _currentScheme = AppColorsLight();

  void setTheme(ThemeMode themeMode) {
    _currentScheme =
        themeMode == ThemeMode.dark ? AppColorsDark() : AppColorsLight();
  }

  @override
  Color get primary => _currentScheme.primary;

  // Other color getters...
}

// Usage in widgets
Container(
  color: Styles.appColors.primary,
  child: Text(
    'Hello World',
    style: Styles.textStyles.headline1,
  ),
)
```

## Conclusion

This architecture provides a solid foundation for building Flutter applications that are:

- **Maintainable**: Clear separation of concerns
- **Testable**: Dependencies are easily mockable
- **Scalable**: New features can be added without affecting existing code
- **Flexible**: Implementation details can be changed without affecting the core business logic

By following these architectural guidelines, we can create high-quality Flutter applications that are easy to develop, test, and maintain.
