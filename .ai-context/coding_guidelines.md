# Coding Guidelines

This document outlines the coding standards and best practices for Flutter application development. Following these guidelines ensures code consistency, readability, and maintainability across the project.

## Code Formatting

### Dart Formatting

- Use the official Dart formatter (`dart format` or IDE formatting)
- Maximum line length: 80 characters
- Use 2 spaces for indentation (default in Dart)
- Run formatter before committing code

### Code Organization

- Group related functionality within files
- Keep files focused on a single responsibility
- Limit file size (aim for <300 lines where possible)
- Use MARK comments to organize sections within files:
  ```dart
  // MARK: - Data Source Providers

  // MARK: - Repository Providers

  // MARK: - Use Case Providers
  ```
- Order class members logically:
  1. Static fields and methods
  2. Instance fields
  3. Constructors
  4. Getters and setters
  5. Public methods
  6. Private methods
  7. Overridden methods (keep @override methods together)
- Use private constructors for utility classes to prevent instantiation:
  ```dart
  class Routes {
    /// Private constructor to prevent instantiation
    Routes._();

    // Static constants and methods...
  }
  ```

## Naming Conventions

Clear and consistent naming is crucial for code readability.

### General Naming Rules

- Use meaningful, descriptive names
- Avoid abbreviations except for common ones (e.g., `id`, `http`)
- Be consistent with terminology throughout the codebase

### Specific Naming Conventions

| Element | Convention | Example |
|---------|------------|--------|
| Classes, enums, extensions | UpperCamelCase | `UserRepository`, `ConnectionState` |
| Variables, methods, parameters | lowerCamelCase | `userName`, `fetchUserData()` |
| Constants | lowerCamelCase | `primaryColor`, `apiBaseUrl` |
| Private members | _lowerCamelCase | `_userCache`, `_calculateTotal()` |
| File names | snake_case | `user_repository.dart`, `login_page.dart` |
| Directory names | snake_case | `data_sources`, `use_cases` |

### Widget Naming

- Name widgets according to their purpose
- Suffix with their widget type for clarity
  - Pages/Screens: `LoginPage`, `ProfileScreen`
  - Reusable widgets: `UserAvatar`, `CustomButton`
  - Widget parts: `_LoginForm`, `_ProfileHeader`

## SOLID Principles Implementation

### Single Responsibility Principle (SRP)

- Each class should have only one reason to change
- Split large classes into smaller, focused ones
- Example: Separate API client from repository logic

```dart
// Good: Separate responsibilities
class UserApiClient {
  Future<Map<String, dynamic>> fetchUser(String id) async {
    // API communication logic
  }
}

class UserRepository {
  final UserApiClient _apiClient;

  UserRepository(this._apiClient);

  Future<User> getUser(String id) async {
    // Repository logic using the API client
    final userData = await _apiClient.fetchUser(id);
    return User.fromJson(userData);
  }
}

// Bad: Mixed responsibilities
class UserRepository {
  Future<User> getUser(String id) async {
    // API communication logic mixed with repository logic
    final response = await http.get(Uri.parse('$apiUrl/users/$id'));
    final userData = jsonDecode(response.body);
    return User.fromJson(userData);
  }
}
```

### Open/Closed Principle (OCP)

- Classes should be open for extension but closed for modification
- Use abstract classes and inheritance to allow extension

```dart
// Good: Open for extension
abstract class AuthenticationMethod {
  Future<User> authenticate();
}

class EmailAuthentication extends AuthenticationMethod {
  final String email;
  final String password;

  EmailAuthentication(this.email, this.password);

  @override
  Future<User> authenticate() async {
    // Email authentication logic
  }
}

class GoogleAuthentication extends AuthenticationMethod {
  @override
  Future<User> authenticate() async {
    // Google authentication logic
  }
}
```

### Liskov Substitution Principle (LSP)

- Subtypes must be substitutable for their base types
- Ensure inherited classes don't break the behavior of parent classes

```dart
// Good: Proper inheritance
abstract class Shape {
  double calculateArea();
}

class Rectangle extends Shape {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  @override
  double calculateArea() => width * height;
}

class Circle extends Shape {
  final double radius;

  Circle(this.radius);

  @override
  double calculateArea() => 3.14 * radius * radius;
}
```

### Interface Segregation Principle (ISP)

- Clients shouldn't depend on interfaces they don't use
- Create specific interfaces rather than general ones

```dart
// Good: Specific interfaces
abstract class UserReader {
  Future<User> getUser(String id);
}

abstract class UserWriter {
  Future<void> saveUser(User user);
}

class UserRepository implements UserReader, UserWriter {
  @override
  Future<User> getUser(String id) async {
    // Implementation
  }

  @override
  Future<void> saveUser(User user) async {
    // Implementation
  }
}

// Client only needs reading capability
class UserProfileBloc {
  final UserReader _userReader;

  UserProfileBloc(this._userReader);

  // Uses only the methods it needs
}
```

### Dependency Inversion Principle (DIP)

- High-level modules shouldn't depend on low-level modules
- Both should depend on abstractions

```dart
// Good: Depending on abstractions
abstract class UserRepository {
  Future<User> getUser(String id);
}

class UserRepositoryImpl implements UserRepository {
  final ApiClient _apiClient;

  UserRepositoryImpl(this._apiClient);

  @override
  Future<User> getUser(String id) async {
    // Implementation
  }
}

class GetUserUseCase {
  final UserRepository _repository;

  GetUserUseCase(this._repository);

  Future<User> execute(String id) => _repository.getUser(id);
}
```

## Documentation Comments

Proper documentation makes code more maintainable and easier to understand.

### Class and Method Documentation

- Document all public APIs (classes, methods, properties)
- Use Dart's documentation comments (`///`)
- Include descriptions of parameters, return values, and exceptions

```dart
/// A service that manages user authentication.
///
/// This service handles user login, registration, and session management.
class AuthService {
  /// Authenticates a user with email and password.
  ///
  /// Returns a [User] object if authentication is successful.
  /// Throws [AuthException] if authentication fails.
  ///
  /// Parameters:
  /// - [email] The user's email address
  /// - [password] The user's password
  Future<User> login(String email, String password) async {
    // Implementation
  }
}
```

### Code Comments

- Use comments to explain "why", not "what"
- Comment complex logic or non-obvious decisions
- Keep comments up-to-date with code changes

```dart
// Good comment: Explains why
// Using a 3-second timeout because the API is known to be slow under high load
final response = await client.get(url).timeout(Duration(seconds: 3));

// Bad comment: Explains what (obvious from the code)
// Get the user's name
final userName = user.name;
```

## Error Handling and Logging

Proper error handling improves application reliability and debuggability.

### Error Handling Principles

- Handle errors at the appropriate level
- Use custom exceptions for domain-specific errors
- Provide meaningful error messages
- Never silently catch exceptions without proper handling

```dart
// Good error handling
Future<User> getUser(String id) async {
  try {
    final response = await _apiClient.get('/users/$id');
    return User.fromJson(response.data);
  } on DioError catch (e) {
    if (e.response?.statusCode == 404) {
      throw UserNotFoundException('User with ID $id not found');
    } else if (e.type == DioErrorType.connectTimeout) {
      throw NetworkException('Connection timeout while fetching user');
    } else {
      throw ServerException('Failed to fetch user: ${e.message}');
    }
  } catch (e) {
    throw UnexpectedException('Unexpected error: $e');
  }
}
```

### Result Pattern

Consider using a Result class for error handling:

```dart
class Result<T> {
  final T? data;
  final AppError? error;

  Result.success(this.data) : error = null;
  Result.failure(this.error) : data = null;

  bool get isSuccess => error == null;
  bool get isFailure => error != null;
}

// Usage
Future<Result<User>> getUser(String id) async {
  try {
    final user = await _apiClient.fetchUser(id);
    return Result.success(user);
  } catch (e) {
    return Result.failure(AppError('Failed to fetch user', e));
  }
}

// Client code
final result = await getUserUseCase.execute('123');
if (result.isSuccess) {
  // Handle success case
  final user = result.data!;
  // Use user data
} else {
  // Handle error case
  final error = result.error!;
  // Show error message
}
```

### Logging

- Use a structured logging approach
- Log important events, errors, and debugging information
- Include context in log messages (user ID, request ID, etc.)
- Use appropriate log levels (debug, info, warning, error)

```dart
// Logging example using a logger package
class UserRepository {
  final Logger _logger = Logger('UserRepository');

  Future<User> getUser(String id) async {
    _logger.info('Fetching user with ID: $id');
    try {
      final user = await _apiClient.fetchUser(id);
      _logger.debug('User fetched successfully: ${user.id}');
      return user;
    } catch (e, stackTrace) {
      _logger.error('Failed to fetch user with ID: $id', e, stackTrace);
      rethrow;
    }
  }
}
```

## Asynchronous Programming

- Use `async`/`await` for asynchronous code
- Handle errors in asynchronous code with try/catch
- Avoid unnecessary `Future.then()` chains when `async`/`await` can be used
- Use `Future.wait()` for parallel asynchronous operations

```dart
// Good: Clean async/await usage
Future<List<Product>> getRecommendedProducts(User user) async {
  try {
    final userPreferences = await _preferencesRepository.getPreferences(user.id);
    final products = await _productRepository.getProductsByCategory(
      userPreferences.favoriteCategory,
    );
    return products.where((p) => p.inStock).toList();
  } catch (e) {
    _logger.error('Failed to get recommended products', e);
    return [];
  }
}

// Good: Parallel operations
Future<void> initializeApp() async {
  try {
    final results = await Future.wait([
      _configService.loadConfig(),
      _authService.checkSession(),
      _databaseService.initialize(),
    ]);

    final config = results[0] as AppConfig;
    final session = results[1] as UserSession?;
    // Use the results
  } catch (e) {
    _logger.error('Initialization failed', e);
    rethrow;
  }
}
```

## Package-Specific Guidelines

### Riverpod State Management

We use Riverpod for state management and dependency injection. Follow these guidelines for consistent implementation:

#### Provider Naming and Organization

- Name providers with a clear suffix indicating their type: `userRepositoryProvider`, `authStateProvider`, etc.
- Group related providers in dedicated provider files
- Use the appropriate provider type for each use case:
  - `Provider`: For simple dependencies and services
  - `StateProvider`: For simple state that can be modified from outside
  - `StateNotifierProvider`: For complex state with business logic
  - `FutureProvider`: For async data that doesn't need to be refreshed often
  - `StreamProvider`: For reactive data streams

#### Provider Examples

```dart
// Good: Clear naming and appropriate provider types
final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(
    apiClient: ref.watch(apiClientProvider),
    localDb: ref.watch(localDbProvider),
  );
});

final userProfileControllerProvider = StateNotifierProvider<UserProfileController, UserProfileState>((ref) {
  return UserProfileController(
    getUserProfile: ref.watch(getUserProfileUseCaseProvider),
  );
});

// Bad: Unclear naming and inappropriate provider type
final userRepo = Provider((ref) => UserRepositoryImpl());
final profileState = StateProvider((ref) => UserProfileState()); // Should use StateNotifier for complex state
```

#### State Class Design

- Use immutable state classes with copyWith methods
- Include explicit error handling in state classes
- Use a dedicated error type (e.g., AppError) instead of generic String errors
- Add a clearError parameter to copyWith for easy error dismissal

```dart
// Good: State class with robust error handling
class ChatState {
  final List<Message> messages;
  final bool isLoading;
  final AppError? error;

  const ChatState({
    this.messages = const [],
    this.isLoading = false,
    this.error,
  });

  ChatState copyWith({
    List<Message>? messages,
    bool? isLoading,
    AppError? error,
    bool clearError = false, // Parameter to explicitly clear errors
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : error ?? this.error, // Clear error if requested
    );
  }
}

// Good: Error handling in state notifier
class ChatNotifier extends StateNotifier<ChatState> {
  ChatNotifier(this._messageService) : super(const ChatState());

  final MessageService _messageService;

  Future<void> sendMessage(String text) async {
    // Clear any previous errors when starting a new operation
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final message = await _messageService.sendMessage(text);
      state = state.copyWith(
        messages: [...state.messages, message],
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e is AppError ? e : AppError.unexpectedFailure,
      );
    }
  }

  // Method to explicitly clear errors
  void clearError() {
    state = state.copyWith(clearError: true);
  }
}
```

### Go Router Navigation

We use Go Router for navigation with a structured, modular approach. Follow these guidelines for consistent implementation:

#### Router Configuration Structure

Our Go Router implementation follows a three-part structure:

1. **Router Factory**: A function that creates and configures the GoRouter instance
2. **Routes Class**: A centralized location for all route path definitions
3. **RoutesBuilder Class**: Contains methods to build each route with its configuration

#### Standard Implementation

```dart
// Router factory function
GoRouter getRouter(WidgetRef ref) {
  return GoRouter(
    initialLocation: Routes.home,
    routes: [
      RoutesBuilder.buildHomeRoute(ref),
      RoutesBuilder.buildProfileRoute(ref),
      RoutesBuilder.buildSettingsRoute(ref),
      // Add other main routes here
    ],
    errorBuilder: (context, state) =>
        ErrorPage(error: 'Page was not found.', stack: StackTrace.current),
  );
}

// Routes class for path definitions
class Routes {
  // MARK: - Main Routes
  static const String home = '/home';
  static const String profile = '/profile';
  static const String settings = '/settings';

  // MARK: - Sub Routes
  static const String detail = '/detail/:id';
  static const String edit = '/edit';

  // MARK: - Parametrized Path Getters
  static String getDetailPath(String id) => 'detail/$id';
  static String getHomeDetailPath(String id) => '$home/detail/$id';
  static String getProfileDetailPath(String id) => '$profile/detail/$id';
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
      routes: [
        _buildHomeDetailRoute(ref),
      ],
    );
  }

  // MARK: - Profile
  static GoRoute buildProfileRoute(WidgetRef ref) {
    return GoRoute(
      path: Routes.profile,
      pageBuilder: (context, state) => const MaterialPage(
        child: ProfilePage(),
      ),
      routes: [
        _buildProfileEditRoute(ref),
      ],
    );
  }

  // MARK: - Sub Routes
  static GoRoute _buildHomeDetailRoute(WidgetRef ref) {
    return GoRoute(
      path: Routes.detail,
      pageBuilder: (context, state) {
        final id = state.pathParameters['id']!;
        return MaterialPage(
          child: DetailPage(id: id),
        );
      },
    );
  }

  static GoRoute _buildProfileEditRoute(WidgetRef ref) {
    return GoRoute(
      path: Routes.edit,
      pageBuilder: (context, state) => const MaterialPage(
        child: ProfileEditPage(),
      ),
    );
  }
}
```

#### Key Principles

- **Separation of Concerns**:
  - `Routes` class only defines path strings and helper methods
  - `RoutesBuilder` handles the actual route configuration

- **Consistent Organization**:
  - Use `MARK` comments to organize sections
  - Group main routes and sub-routes separately
  - Prefix private route builders with underscore

- **Dependency Injection**:
  - Pass `WidgetRef` to all route builders for access to providers
  - This allows routes to access state and services

- **Naming Conventions**:
  - Main route builders: `buildFeatureRoute`
  - Sub-route builders: `_buildFeatureSubRoute`
  - Path getters: `getFeatureSubPath`

#### Navigation Calls

- Prefer using context-based navigation with the Routes class:
  ```dart
  context.go(Routes.home);
  context.go(Routes.getHomeDetailPath('123'));
  ```

- For navigation outside of widgets, inject the router through Riverpod:
  ```dart
  final routerProvider = Provider<GoRouter>((ref) => getRouter(ref));

  class AuthService {
    final Ref ref;

    AuthService(this.ref);

    void logout() {
      // Perform logout logic
      ref.read(routerProvider).go(Routes.home);
    }
  }
  ```

### Localization (l10n)

We use Flutter's intl package with l10n for localization. Follow these guidelines for consistent implementation:

#### String Organization

- Keep all user-facing strings in ARB files, never hardcode them
- Organize strings by feature or screen
- Add descriptive comments for translators
- Use parameters for dynamic content

#### Usage in Code

- Always access translations through the AppLocalizations class
- Use the context extension method: `context.l10n` (define this extension for convenience)

#### Example:

```dart
// Extension for easier access
extension LocalizationX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

// In a widget
Text(context.l10n.welcomeMessage),
Text(context.l10n.userGreeting(user.name)),
```

## Conclusion

Following these coding guidelines will help maintain a consistent, readable, and maintainable codebase. These guidelines should be applied across all projects to ensure code quality and developer productivity.

Remember that these guidelines are meant to help, not hinder. There may be situations where deviating from these guidelines makes sense, but such deviations should be justified and documented.
