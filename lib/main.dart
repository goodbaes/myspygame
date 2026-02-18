import 'package:app_localization/l10n/app_localizations.dart';
import 'package:app_localization/localization_service.dart';
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
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentL10n = AppLocalizations.of(context);
    if (currentL10n != null) {
      LocalizationService().update(currentL10n);
    }
  }

  @override
  Widget build(BuildContext context) {
    final featureRegistry = FeatureRegistry();
    featureRegistry.register(RolesFeature());
    final navigationService = NavigationService();

    return MaterialApp(
      navigatorKey: navigationService.navigatorKey,
      title: 'Spy Game',
      theme: ThemeData(primarySwatch: Colors.blue),
      localizationsDelegates: const [AppLocalizations.delegate],
      supportedLocales: const [Locale('en', 'US'), Locale('ru', 'RU')],
      home: const HomeScreen(),
      routes: featureRegistry.routes,
    );
  }
}
