import 'package:architecture/architecture.dart';
import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'presentation/roles_screen.dart';

class RolesFeature extends Feature {
  @override
  String get name => 'roles';

  @override
  Map<String, WidgetBuilder> get routes => {
    AppRoutes.roles: (context) {
      final settings = ModalRoute.of(context)!.settings.arguments as GameRoundSettings;
      return RolesScreen(settings: settings);
    },
  };
}
