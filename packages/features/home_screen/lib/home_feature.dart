import 'package:architecture/architecture.dart';
import 'package:flutter/widgets.dart';
import 'presentation/home_screen.dart';

/// The [Feature] registration for the home screen.
///
/// Registers the [AppRoutes.home] route and provides the [HomeScreen] widget.
class HomeFeature extends Feature {
  @override
  String get name => 'home';

  @override
  Map<String, WidgetBuilder> get routes => {AppRoutes.home: (context) => const HomeScreen()};
}
