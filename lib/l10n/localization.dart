import 'package:flutter/widgets.dart';
import 'package:myspygame/l10n/app_localizations.dart';

/// Глобальный навигатор для доступа к context вне виджетов.
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// Удобный глобальный геттер для локализации.
/// Теперь можно писать просто: `l10n.hello`
AppLocalizations get l10n => AppLocalizations.of(navigatorKey.currentContext!)!;
