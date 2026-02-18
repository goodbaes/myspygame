/// Centralised route name constants for the application.
///
/// All features must register their routes using these constants,
/// and all navigation calls must reference them. This prevents
/// magic strings from being scattered across the codebase and
/// ensures that renaming a route is a single-point change.
///
/// Usage:
/// ```dart
/// NavigationService.instance.pushNamed(AppRoutes.roles, arguments: settings);
/// ```
abstract final class AppRoutes {
  /// The home screen — the app's entry point.
  static const String home = '/home';

  /// The roles screen — shown after game settings are configured.
  static const String roles = '/roles';
}
