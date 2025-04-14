# Prompt Templates for AI-Assisted Flutter Development

This document provides templates for generating Flutter code using AI tools. These templates are designed to follow our Clean Architecture approach and coding standards.

## General Guidelines for AI Prompts

1. **Be specific**: Clearly describe the feature or component you want to generate
2. **Provide context**: Include information about the existing architecture and dependencies
3. **Specify requirements**: List all functional and non-functional requirements
4. **Reference patterns**: Mention specific patterns or approaches to follow
5. **Request tests**: Always ask for appropriate tests for the generated code
6. **Specify key technologies**: Always mention our core technologies:
   - **State Management**: Riverpod for state management and dependency injection
   - **Navigation**: Go Router for routing and navigation
   - **Localization**: l10n for internationalization

## Feature Module Generation

Use this template to generate a complete feature module following Clean Architecture.

```text
Generate a complete Flutter feature module for [FEATURE_NAME] following Clean Architecture with data, domain, and presentation layers.

Feature description:
[DETAILED_DESCRIPTION_OF_THE_FEATURE]

Requirements:
- [REQUIREMENT_1]
- [REQUIREMENT_2]
- ...

The feature should include:

1. Domain Layer:
   - Entities: [LIST_OF_ENTITIES]
   - Repository interfaces: [LIST_OF_REPOSITORY_INTERFACES]
   - Use cases: [LIST_OF_USE_CASES]

2. Data Layer:
   - DTOs: [LIST_OF_DTOS]
   - Repository implementations: [LIST_OF_REPOSITORY_IMPLEMENTATIONS]
   - Data sources: [LIST_OF_DATA_SOURCES]
   - Mappers: [LIST_OF_MAPPERS]

3. Presentation Layer:
   - Pages/screens: [LIST_OF_PAGES]
   - Controllers/ViewModels: [LIST_OF_CONTROLLERS]
   - State management: Use Riverpod with StateNotifier
   - Widgets: [LIST_OF_WIDGETS]

Dependencies:
- [LIST_OF_DEPENDENCIES_AND_PACKAGES]

Follow these guidelines:
- Use proper error handling with custom exceptions
- Implement dependency injection using Riverpod
- Follow the Result pattern for error handling
- Include unit tests for all layers
- Follow SOLID principles
- Use proper naming conventions as per our coding guidelines
```

### Example Feature Module Prompt

```text
Generate a complete Flutter feature module for "User Authentication" following Clean Architecture with data, domain, and presentation layers.

Feature description:
A user authentication feature that allows users to register, login, and manage their profile. The authentication should support email/password and social login (Google).

Requirements:
- User registration with email and password
- User login with email and password
- Social login with Google
- Password reset functionality
- Profile management (view and edit)
- Secure token storage
- Automatic login if token is valid

The feature should include:

1. Domain Layer:
   - Entities: User, AuthCredentials, AuthToken
   - Repository interfaces: AuthRepository, UserRepository
   - Use cases: RegisterUser, LoginUser, LogoutUser, GetUserProfile, UpdateUserProfile, ResetPassword, CheckAuthStatus

2. Data Layer:
   - DTOs: UserDto, AuthCredentialsDto, AuthTokenDto
   - Repository implementations: AuthRepositoryImpl, UserRepositoryImpl
   - Data sources: AuthRemoteDataSource, AuthLocalDataSource, UserRemoteDataSource
   - Mappers: UserMapper, AuthCredentialsMapper, AuthTokenMapper

3. Presentation Layer:
   - Pages/screens: LoginPage, RegisterPage, ForgotPasswordPage, ProfilePage
   - Controllers/ViewModels: AuthController, ProfileController
   - State management: Use Riverpod with StateNotifier
   - Widgets: EmailFormField, PasswordFormField, SocialLoginButton, ProfileForm

Dependencies:
- dio: ^5.0.0 (for API requests)
- flutter_secure_storage: ^8.0.0 (for token storage)
- google_sign_in: ^6.0.0 (for Google authentication)
- flutter_riverpod: ^2.3.0 (for state management and DI)
- go_router: ^12.0.0 (for navigation)
- flutter_localizations: ^2.0.0 (for localization)
- intl: ^0.18.0 (for localization support)

Follow these guidelines:
- Use proper error handling with custom exceptions
- Implement dependency injection using Riverpod
- Follow the Result pattern for error handling
- Include unit tests for all layers
- Follow SOLID principles
- Use proper naming conventions as per our coding guidelines
```

## Repository Generation

Use this template to generate a repository following Clean Architecture.

```text
Generate a repository for [ENTITY_NAME] following Clean Architecture principles. The repository should handle [DESCRIBE_FUNCTIONALITY].

Include:

1. Domain Layer:
   - Repository interface with the following methods:
     - [METHOD_1]
     - [METHOD_2]
     - ...

2. Data Layer:
   - Repository implementation
   - Data sources (remote and/or local)
   - DTOs with appropriate mapping functions

Requirements:
- [REQUIREMENT_1]
- [REQUIREMENT_2]
- ...

Error handling:
- Use the Result pattern for error handling
- Define appropriate custom exceptions

Follow these guidelines:
- Implement proper dependency injection
- Follow SOLID principles
- Include unit tests
- Use appropriate naming conventions
```

### Example Repository Prompt

```text
Generate a repository for Product following Clean Architecture principles. The repository should handle fetching, searching, and managing product data from both API and local cache.

Include:

1. Domain Layer:
   - Repository interface with the following methods:
     - Future<List<Product>> getProducts()
     - Future<Product> getProductById(String id)
     - Future<List<Product>> searchProducts(String query)
     - Future<List<Product>> getProductsByCategory(String category)
     - Future<void> favoriteProduct(String id, bool isFavorite)

2. Data Layer:
   - Repository implementation
   - Data sources (ProductRemoteDataSource, ProductLocalDataSource)
   - DTOs with appropriate mapping functions (ProductDto)

Requirements:
- Implement caching strategy (fetch from cache first, then network)
- Cache products locally for offline access
- Handle pagination for product listing
- Support filtering and sorting options

Error handling:
- Use the Result pattern for error handling
- Define appropriate custom exceptions (ProductNotFoundException, NetworkException, CacheException)

Follow these guidelines:
- Implement proper dependency injection
- Follow SOLID principles
- Include unit tests
- Use appropriate naming conventions
```

## UI Component Generation

Use this template to generate UI components.

```text
Generate a Flutter [COMPONENT_TYPE] for [COMPONENT_NAME] with the following requirements:

1. Description:
   [DETAILED_DESCRIPTION]

2. Features:
   - [FEATURE_1]
   - [FEATURE_2]
   - ...

3. Parameters/Props:
   - [PARAMETER_1]: [DESCRIPTION]
   - [PARAMETER_2]: [DESCRIPTION]
   - ...

4. Behavior:
   - [BEHAVIOR_1]
   - [BEHAVIOR_2]
   - ...

5. Styling:
   - [STYLE_REQUIREMENT_1]
   - [STYLE_REQUIREMENT_2]
   - ...

6. Accessibility:
   - [ACCESSIBILITY_REQUIREMENT_1]
   - [ACCESSIBILITY_REQUIREMENT_2]
   - ...

Include:
- Proper widget structure
- State management (if needed)
- Responsive design considerations
- Widget tests
- Documentation comments
```

### Example UI Component Prompt

```text
Generate a Flutter widget for "ProductCard" with the following requirements:

1. Description:
   A card widget that displays product information in a grid or list view, showing the product image, name, price, and rating. It should also have a favorite button.

2. Features:
   - Display product image with loading and error states
   - Show product name, price, and rating
   - Toggle favorite status
   - Handle tap to navigate to product details

3. Parameters/Props:
   - product: Product (required) - The product entity to display
   - onTap: Function (required) - Callback when card is tapped
   - onFavoriteToggle: Function(bool) (required) - Callback when favorite status changes
   - isGridView: bool (default: true) - Whether to display in grid or list layout
   - imageHeight: double (optional) - Custom height for the image

4. Behavior:
   - Animate favorite button when toggled
   - Show discount badge if product is on sale
   - Display "Out of Stock" overlay if product is not available
   - Implement hero animation for the product image

5. Styling:
   - Use rounded corners (borderRadius: 8)
   - Apply subtle elevation (elevation: 2)
   - Use appropriate padding (16px for content)
   - Implement responsive sizing based on parent constraints

6. Accessibility:
   - Include semantic labels for screen readers
   - Ensure sufficient color contrast
   - Provide appropriate tap target sizes

Include:
- Proper widget structure
- State management (if needed)
- Responsive design considerations
- Widget tests
- Documentation comments
```

## Unit Test Generation

Use this template to generate unit tests.

```text
Generate unit tests for [CLASS_NAME] with the following requirements:

1. Class description:
   [DESCRIPTION_OF_THE_CLASS]

2. Methods to test:
   - [METHOD_1]: [DESCRIPTION]
   - [METHOD_2]: [DESCRIPTION]
   - ...

3. Dependencies to mock:
   - [DEPENDENCY_1]: [DESCRIPTION]
   - [DEPENDENCY_2]: [DESCRIPTION]
   - ...

4. Test scenarios:
   - [SCENARIO_1]
   - [SCENARIO_2]
   - ...

5. Edge cases to consider:
   - [EDGE_CASE_1]
   - [EDGE_CASE_2]
   - ...

Include:
- Proper test setup and teardown
- Appropriate mocking of dependencies
- Clear test descriptions
- Coverage for success and failure cases
- Follow the Arrange-Act-Assert pattern
```

### Example Unit Test Prompt

```text
Generate unit tests for GetUserProfileUseCase with the following requirements:

1. Class description:
   A use case that retrieves a user's profile information by ID from the UserRepository.

2. Methods to test:
   - execute(String userId): Returns a Future<Result<User>> with the user profile or an error

3. Dependencies to mock:
   - UserRepository: The repository that provides user data

4. Test scenarios:
   - Successfully retrieving a user profile when repository returns valid data
   - Handling a non-existent user (repository returns UserNotFoundException)
   - Handling network errors (repository returns NetworkException)
   - Handling server errors (repository returns ServerException)
   - Handling unexpected errors (repository throws an unexpected exception)

5. Edge cases to consider:
   - Empty user ID parameter
   - Repository returns null instead of throwing an exception
   - Repository returns incomplete user data

Include:
- Proper test setup and teardown
- Appropriate mocking of dependencies
- Clear test descriptions
- Coverage for success and failure cases
- Follow the Arrange-Act-Assert pattern
```

## Integration Test Generation

Use this template to generate integration tests.

```text
Generate Flutter integration tests for [FEATURE_NAME] with the following requirements:

1. Feature description:
   [DETAILED_DESCRIPTION_OF_THE_FEATURE]

2. Screens/Widgets to test:
   - [SCREEN_1]: [DESCRIPTION]
   - [SCREEN_2]: [DESCRIPTION]
   - ...

3. User flows to test:
   - [FLOW_1]: [DESCRIPTION]
   - [FLOW_2]: [DESCRIPTION]
   - ...

4. Dependencies to mock:
   - [DEPENDENCY_1]: [DESCRIPTION]
   - [DEPENDENCY_2]: [DESCRIPTION]
   - ...

5. Test scenarios:
   - [SCENARIO_1]
   - [SCENARIO_2]
   - ...

Include:
- Proper test setup and teardown
- Appropriate mocking of dependencies
- Clear test descriptions
- Handling of asynchronous operations
- Verification of UI elements and interactions
```

### Example Integration Test Prompt

```text
Generate Flutter integration tests for "User Authentication" with the following requirements:

1. Feature description:
   The authentication feature allows users to register, login, and manage their profile using email/password or social login.

2. Screens/Widgets to test:
   - LoginPage: Screen for user login with email/password and social options
   - RegisterPage: Screen for new user registration
   - ForgotPasswordPage: Screen for password reset
   - ProfilePage: Screen for viewing and editing user profile

3. User flows to test:
   - Registration flow: User navigates to register page, fills form, submits, and is redirected to home
   - Login flow: User enters credentials, submits, and is redirected to home
   - Password reset flow: User requests password reset, receives email, sets new password
   - Profile editing flow: User navigates to profile, edits information, saves changes

4. Dependencies to mock:
   - AuthRepository: For authentication operations
   - UserRepository: For user profile operations
   - NavigationService: For navigation between screens

5. Test scenarios:
   - Successful registration with valid data
   - Registration validation errors (email format, password strength)
   - Successful login with valid credentials
   - Failed login with invalid credentials
   - Password reset request and completion
   - Viewing and updating profile information
   - Form validation on profile editing

Include:
- Proper test setup and teardown
- Appropriate mocking of dependencies
- Clear test descriptions
- Handling of asynchronous operations
- Verification of UI elements and interactions
```

## Navigation Configuration

Use this template to generate Go Router configuration for your application.

```text
Generate Go Router configuration for a Flutter application with the following routes and features:

Routes:
- [ROUTE_1]: [DESCRIPTION]
- [ROUTE_2]: [DESCRIPTION]
- ...

Authentication requirements:
- [AUTH_REQUIREMENT_1]
- [AUTH_REQUIREMENT_2]
- ...

Navigation features needed:
- [FEATURE_1]
- [FEATURE_2]
- ...

Include:
- Route definitions with appropriate parameters
- Navigation guards for authentication
- Integration with Riverpod for state-based navigation
- Helper methods for generating route paths with parameters
- Error handling for unknown routes
```

### Example Navigation Configuration Prompt

```text
Generate Go Router configuration for a Flutter application with the following routes and features:

Routes:
- Home (/home): Main dashboard screen
- Login (/login): User authentication screen
- Register (/register): New user registration
- Profile (/profile): User profile screen
- Settings (/settings): App settings screen
- Product Details (/products): Product listing screen
- Product Detail (/detail/:id): Product detail with dynamic product ID as a sub-route

Authentication requirements:
- Unauthenticated users should only access login and register routes
- Authenticated users should not be able to access login and register routes
- Redirect unauthenticated users to login when they try to access protected routes

Navigation features needed:
- Deep linking support
- URL path parameters for dynamic content
- Query parameters for search and filtering
- Nested navigation for settings section
- Navigation history management

Include:
- Router factory function that takes a WidgetRef
- Routes class with static constants for all paths
- RoutesBuilder class with static methods for each route
- Proper organization with MARK comments
- Sub-routes defined as nested routes
- Helper methods for generating parametrized paths
- Error handling for unknown routes
```

## Localization Template

Use this template to generate localization files for your application.

```text
Generate localization files for a Flutter application with the following features:

Application sections:
- [SECTION_1]: [DESCRIPTION]
- [SECTION_2]: [DESCRIPTION]
- ...

Languages to support:
- [LANGUAGE_1]
- [LANGUAGE_2]
- ...

Include:
- ARB file templates for each language
- String keys following a consistent naming convention
- Placeholders for dynamic content
- Pluralization examples where needed
- Comments for translators
- Setup instructions for the l10n package
```

### Example Localization Prompt

```text
Generate localization files for a Flutter application with the following features:

Application sections:
- Authentication: Login, registration, password reset
- User Profile: Profile viewing and editing
- Product Catalog: Browsing and searching products
- Shopping Cart: Adding and managing items
- Checkout: Payment and order completion
- Settings: App preferences and account settings

Languages to support:
- English (en)
- Czech (cs)

Include:
- ARB file templates for each language
- String keys following a consistent naming convention
- Placeholders for dynamic content
- Pluralization examples where needed
- Comments for translators
- Setup instructions for the l10n package
```

## Conclusion

These templates provide a structured approach to generating Flutter code using AI tools. By following these templates, you can ensure that the generated code adheres to our architectural principles, coding standards, and best practices.

When using these templates:

1. Customize them to your specific needs
2. Be as detailed as possible in your requirements
3. Review and refine the generated code
4. Ensure tests are included and working
5. Integrate the code with your existing codebase
6. Always specify our core technologies: Riverpod, Go Router, and l10n

Remember that AI-generated code is a starting point and may require adjustments to fully meet your requirements and integrate with your existing codebase.
