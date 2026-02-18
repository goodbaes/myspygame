import 'package:flutter/widgets.dart';

/// A service that provides top-level navigation capabilities without a [BuildContext].
///
/// [NavigationService] is a singleton — the same [navigatorKey] instance is
/// shared across the entire app, which is required for context-free navigation.
///
/// Register the key with [MaterialApp]:
/// ```dart
/// MaterialApp(navigatorKey: NavigationService.instance.navigatorKey)
/// ```
///
/// Navigate from anywhere (including BLoCs and services):
/// ```dart
/// NavigationService.instance.pushNamed(AppRoutes.roles, arguments: settings);
/// ```
class NavigationService {
  NavigationService._();

  /// The single shared instance.
  static final NavigationService instance = NavigationService._();

  /// The global key used by [MaterialApp] to provide access to the [Navigator].
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Pushes a named route onto the navigator.
  Future<dynamic>? pushNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  /// Replaces the current route with a named route.
  Future<dynamic>? pushReplacementNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushReplacementNamed(routeName, arguments: arguments);
  }

  /// Pops the top-most route off the navigator.
  void pop([dynamic result]) {
    return navigatorKey.currentState?.pop(result);
  }
}
