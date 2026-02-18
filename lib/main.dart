import 'package:app_localization/l10n/app_localizations.dart';
import 'package:architecture/architecture.dart';
import 'package:flutter/material.dart';
import 'package:myspygame/presentation/screens/home_screen.dart';
import 'package:roles_screen/roles_screen.dart';

void main() {
  runApp(const RootAppWrapper());
}

class RootAppWrapper extends StatefulWidget {
  const RootAppWrapper({super.key});

  @override
  State<RootAppWrapper> createState() => _RootAppWrapperState();
}

class _RootAppWrapperState extends State<RootAppWrapper> {
  final FeatureRegistry _featureRegistry = FeatureRegistry();
  final NavigationService _navigationService = NavigationService();

  @override
  void initState() {
    super.initState();
    _featureRegistry.register(RolesFeature());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigationService.navigatorKey,
      title: 'Spy Game',
      theme: ThemeData(primarySwatch: Colors.blue),
      localizationsDelegates: const [AppLocalizations.delegate],
      supportedLocales: const [Locale('en', 'US')],
      home: const HomeScreen(),
      routes: _featureRegistry.routes,
    );
  }
}
