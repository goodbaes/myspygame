import 'package:architecture/architecture.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

class TestFeature extends Feature {
  @override
  String get name => 'test_feature';

  @override
  Map<String, WidgetBuilder> get routes => {'/test': (context) => const SizedBox()};
}

class AnotherFeature extends Feature {
  @override
  String get name => 'another';
  @override
  Map<String, WidgetBuilder> get routes => {'/another': (c) => const SizedBox()};
}

void main() {
  group('FeatureRegistry', () {
    late FeatureRegistry registry;

    setUp(() {
      registry = FeatureRegistry();
    });

    test('should register a feature', () {
      final feature = TestFeature();
      registry.register(feature);
      expect(registry.routes.containsKey('/test'), isTrue);
    });

    test('should throw exception when registering same feature name twice', () {
      final feature1 = TestFeature();
      final feature2 = TestFeature();
      registry.register(feature1);
      expect(() => registry.register(feature2), throwsException);
    });

    test('should aggregate routes from multiple features', () {
      registry.register(TestFeature());
      registry.register(AnotherFeature());

      expect(registry.routes.length, 2);
      expect(registry.routes.containsKey('/test'), isTrue);
      expect(registry.routes.containsKey('/another'), isTrue);
    });
  });
}
