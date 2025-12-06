import 'package:flutter/widgets.dart';
import 'feature.dart';

class FeatureRegistry {
  final Map<String, Feature> _features = {};

  void register(Feature feature) {
    if (_features.containsKey(feature.name)) {
      throw Exception('Feature ${feature.name} is already registered');
    }
    _features[feature.name] = feature;
  }

  Map<String, WidgetBuilder> get routes {
    final allRoutes = <String, WidgetBuilder>{};
    for (final feature in _features.values) {
      allRoutes.addAll(feature.routes);
    }
    return allRoutes;
  }
}
