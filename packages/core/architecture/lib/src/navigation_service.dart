import 'package:flutter/widgets.dart';

/// A service that provides top-level navigation capabilities without a context.
///
/// This uses a [navigatorKey] to access the [NavigatorState] from anywhere
/// in the application.
class NavigationService {
  /// The global key used by the [MaterialApp] to provide access to the [Navigator].
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
