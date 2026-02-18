import 'package:flutter/widgets.dart';

/// Base class for all features in the application.
///
/// Features are independent modules that provide their own routes
/// and logical isolation.
abstract class Feature {
  /// The unique name of the feature.
  String get name;

  /// The routes provided by this feature.
  Map<String, WidgetBuilder> get routes;
}
