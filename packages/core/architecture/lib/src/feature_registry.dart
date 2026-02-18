import 'package:flutter/widgets.dart';
import 'feature.dart';

/// A registry that manages all registered features in the application.
///
/// This serves as a central point for feature management and route aggregation.
class FeatureRegistry {
  final Map<String, Feature> _features = {};

  /// Registers a [feature] in the registry.
  ///
  /// Throws an [Exception] if a feature with the same name is already registered.
  void register(Feature feature) {
    if (_features.containsKey(feature.name)) {
      throw Exception('Feature ${feature.name} is already registered');
    }
    _features[feature.name] = feature;
  }

  /// Returns a combined map of all routes from all registered features.
  Map<String, WidgetBuilder> get routes {
    final allRoutes = <String, WidgetBuilder>{};
    for (final feature in _features.values) {
      allRoutes.addAll(feature.routes);
    }
    return allRoutes;
  }
}
